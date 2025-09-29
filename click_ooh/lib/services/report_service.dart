import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../types/types.dart';

Future<void> submitReport(
  ServiceAssignment selectedAssignment,
  String reportTitle,
  String reportDescription,
  List<String> reportPhotos,
  User user,
) async {
  // Upload photos to storage
  final attachments = <Map<String, dynamic>>[];
  for (final uri in reportPhotos) {
    final file = File(uri);
    final filename = 'report_${DateTime.now().millisecondsSinceEpoch}_${uri.hashCode}.jpg';
    final storageRef = FirebaseStorage.instance.ref().child('reports/$filename');
    await storageRef.putFile(file);
    final downloadURL = await storageRef.getDownloadURL();
    attachments.add({
      'fileName': filename,
      'fileType': 'image/jpeg',
      'fileUrl': downloadURL,
      'note': '',
    });
  }

  // Create report object
  final endDate = selectedAssignment.coveredDateEnd is Timestamp
      ? (selectedAssignment.coveredDateEnd as Timestamp).toDate()
      : selectedAssignment.coveredDateEnd is String
          ? DateTime.parse(selectedAssignment.coveredDateEnd)
          : DateTime.now();
  final startDate = selectedAssignment.coveredDateStart is Timestamp
      ? (selectedAssignment.coveredDateStart as Timestamp).toDate()
      : selectedAssignment.coveredDateStart is String
          ? DateTime.parse(selectedAssignment.coveredDateStart)
          : DateTime.now();

  final report = {
    'attachments': attachments,
    'bookingDates': {
      'end': Timestamp.fromDate(endDate),
      'start': Timestamp.fromDate(startDate),
      'breakdate': Timestamp.fromDate(startDate),
    },
    'breakdate': Timestamp.fromDate(startDate),
    'category': 'logistics',
    'client': selectedAssignment.requestedBy.name,
    'clientId': selectedAssignment.requestedBy.id,
    'companyId': selectedAssignment.companyId,
    'completionPercentage': 100,
    'created': Timestamp.fromDate(DateTime.now()),
    'createdBy': user.uid,
    'createdByName': user.phoneNumber ?? 'user-name',
    'date': DateTime.now().toIso8601String().split('T')[0],
    'joNumber': selectedAssignment.joNumber,
    'joType': 'Service',
    'location': selectedAssignment.projectSiteLocation,
    'priority': selectedAssignment.priority,
    'product': {
      'content_type': selectedAssignment.technology,
      'id': selectedAssignment.projectSiteId,
      'name': selectedAssignment.projectSiteName,
    },
    'specs_rental': {},
    'reportType': 'Completion Report',
    'sales': selectedAssignment.sales,
    'sellerId': selectedAssignment.assignedTo,
    'siteId': selectedAssignment.projectSiteId,
    'siteName': selectedAssignment.projectSiteName,
    'status': 'posted',
    'subcategory': selectedAssignment.serviceType,
    'tags': ['service-report', selectedAssignment.serviceType],
    'updated': Timestamp.fromDate(DateTime.now()),
  };

  await FirebaseFirestore.instance.collection('reports').add(report);
}