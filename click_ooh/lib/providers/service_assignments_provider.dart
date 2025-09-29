import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../types/types.dart';

class ServiceAssignmentsProvider extends ChangeNotifier {
  List<ServiceAssignment> _serviceAssignments = [];
  bool _isLoadingAssignments = false;
  bool _hasFetched = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  DocumentSnapshot? _lastDocument;
  static const int pageSize = 15;

  List<ServiceAssignment> get serviceAssignments => _serviceAssignments;
  bool get isLoadingAssignments => _isLoadingAssignments;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  Future<void> fetchAssignments(User? user) async {
    if (user == null || _hasFetched) {
      print('fetchAssignments: Skipping fetch - user: ${user != null}, hasFetched: $_hasFetched');
      return;
    }

    _isLoadingAssignments = true;
    notifyListeners();

    try {
      // Simulate network delay for demo
      await Future.delayed(const Duration(milliseconds: 1500));

      // Try to fetch from Firebase, fallback to mock data if fails
      try {
        print('fetchAssignments: Attempting to fetch first page from Firebase');
        final querySnapshot = await FirebaseFirestore.instance
            .collection('service_assignments')
            .orderBy('created', descending: true)
            .limit(pageSize)
            .get();

        print('fetchAssignments: Query returned ${querySnapshot.docs.length} documents');

        final assignments = <ServiceAssignment>[];
        for (final doc in querySnapshot.docs) {
          try {
            final assignment = ServiceAssignment.fromJson({'id': doc.id, ...doc.data()});
            assignments.add(assignment);
          } catch (parseError) {
            print('fetchAssignments: Failed to parse document ${doc.id}: $parseError');
            // Skip this document
          }
        }

        _serviceAssignments = assignments;
        _lastDocument = querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;
        _hasMore = querySnapshot.docs.length == pageSize;

        print('fetchAssignments: Successfully parsed ${assignments.length} assignments, hasMore: $_hasMore');
      } catch (firebaseError) {
        print('fetchAssignments: Firebase error: $firebaseError');
        // Fallback to mock data
        _serviceAssignments = _getMockAssignments();
        _hasMore = false;
        print('fetchAssignments: Using mock data (${_serviceAssignments.length} items)');
      }
    } catch (error) {
      print('fetchAssignments: Unexpected error: $error');
      // If all fails, use mock data
      _serviceAssignments = _getMockAssignments();
      _hasMore = false;
      print('fetchAssignments: Fallback to mock data (${_serviceAssignments.length} items)');
    } finally {
      _isLoadingAssignments = false;
      _hasFetched = true;
      notifyListeners();
      print('fetchAssignments: Completed, notifying listeners');
    }
  }

  Future<void> loadMoreAssignments() async {
    if (_isLoadingMore || !_hasMore || _lastDocument == null) {
      print('loadMoreAssignments: Skipping - loading: $_isLoadingMore, hasMore: $_hasMore, lastDoc: ${_lastDocument != null}');
      return;
    }

    _isLoadingMore = true;
    notifyListeners();

    try {
      print('loadMoreAssignments: Fetching next page');
      final querySnapshot = await FirebaseFirestore.instance
          .collection('service_assignments')
          .orderBy('created', descending: true)
          .startAfterDocument(_lastDocument!)
          .limit(pageSize)
          .get();

      print('loadMoreAssignments: Query returned ${querySnapshot.docs.length} documents');

      final newAssignments = <ServiceAssignment>[];
      for (final doc in querySnapshot.docs) {
        try {
          final assignment = ServiceAssignment.fromJson({'id': doc.id, ...doc.data()});
          newAssignments.add(assignment);
        } catch (parseError) {
          print('loadMoreAssignments: Failed to parse document ${doc.id}: $parseError');
          // Skip this document
        }
      }

      _serviceAssignments.addAll(newAssignments);
      _lastDocument = querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;
      _hasMore = querySnapshot.docs.length == pageSize;

      print('loadMoreAssignments: Added ${newAssignments.length} assignments, total: ${_serviceAssignments.length}, hasMore: $_hasMore');
    } catch (error) {
      print('loadMoreAssignments: Error loading more: $error');
      _hasMore = false; // Stop trying to load more on error
    } finally {
      _isLoadingMore = false;
      notifyListeners();
      print('loadMoreAssignments: Completed');
    }
  }

  List<ServiceAssignment> _getMockAssignments() {
    return [
      ServiceAssignment(
        id: 'mock-1',
        alarmDate: null,
        alarmTime: '09:00',
        assignedTo: 'user1',
        assignedToName: 'John Doe',
        attachments: [],
        companyId: 'company1',
        coveredDateEnd: null,
        coveredDateStart: null,
        created: null,
        crew: 'Team A',
        equipmentRequired: 'Ladder',
        gondola: 'G1',
        illuminationNits: '1000',
        joNumber: 'JO001',
        jobOrderId: 'JOB001',
        materialSpecs: 'Standard',
        message: 'Service assignment 1',
        priority: 'High',
        projectSiteId: 'site1',
        projectSiteLocation: 'Location 1',
        projectSiteName: 'Site 1',
        projectKey: 'key1',
        remarks: 'Remarks 1',
        requestedBy: RequestedBy(
          department: 'Dept 1',
          id: 'req1',
          name: 'Requester 1',
        ),
        saNumber: 'SA001',
        sales: 'Sales1',
        serviceDuration: '2 hours',
        serviceExpenses: [],
        serviceType: 'Maintenance',
        status: 'Pending',
        technology: 'LED',
        updated: null,
      ),
      ServiceAssignment(
        id: 'mock-2',
        alarmDate: null,
        alarmTime: '14:00',
        assignedTo: 'user2',
        assignedToName: 'Jane Smith',
        attachments: [],
        companyId: 'company1',
        coveredDateEnd: null,
        coveredDateStart: null,
        created: null,
        crew: 'Team B',
        equipmentRequired: 'Tools',
        gondola: 'G2',
        illuminationNits: '800',
        joNumber: 'JO002',
        jobOrderId: 'JOB002',
        materialSpecs: 'Premium',
        message: 'Service assignment 2',
        priority: 'Medium',
        projectSiteId: 'site2',
        projectSiteLocation: 'Location 2',
        projectSiteName: 'Site 2',
        projectKey: 'key2',
        remarks: 'Remarks 2',
        requestedBy: RequestedBy(
          department: 'Dept 2',
          id: 'req2',
          name: 'Requester 2',
        ),
        saNumber: 'SA002',
        sales: 'Sales2',
        serviceDuration: '3 hours',
        serviceExpenses: [],
        serviceType: 'Installation',
        status: 'In Progress',
        technology: 'LCD',
        updated: null,
      ),
    ];
  }
}