class RequestedBy {
  final String department;
  final String id;
  final String name;

  RequestedBy({
    required this.department,
    required this.id,
    required this.name,
  });

  factory RequestedBy.fromJson(Map<String, dynamic> json) {
    return RequestedBy(
      department: json['department'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'id': id,
      'name': name,
    };
  }
}

class ServiceAssignment {
  final String id;
  final dynamic alarmDate;
  final String alarmTime;
  final String assignedTo;
  final String assignedToName;
  final List<dynamic> attachments;
  final String companyId;
  final dynamic coveredDateEnd;
  final dynamic coveredDateStart;
  final dynamic created;
  final String crew;
  final String equipmentRequired;
  final String gondola;
  final String illuminationNits;
  final String joNumber;
  final String jobOrderId;
  final String materialSpecs;
  final String message;
  final String priority;
  final String projectSiteId;
  final String projectSiteLocation;
  final String projectSiteName;
  final String projectKey;
  final String remarks;
  final RequestedBy requestedBy;
  final String saNumber;
  final String sales;
  final String serviceDuration;
  final List<dynamic> serviceExpenses;
  final String serviceType;
  final String status;
  final String technology;
  final dynamic updated;

  ServiceAssignment({
    required this.id,
    required this.alarmDate,
    required this.alarmTime,
    required this.assignedTo,
    required this.assignedToName,
    required this.attachments,
    required this.companyId,
    required this.coveredDateEnd,
    required this.coveredDateStart,
    required this.created,
    required this.crew,
    required this.equipmentRequired,
    required this.gondola,
    required this.illuminationNits,
    required this.joNumber,
    required this.jobOrderId,
    required this.materialSpecs,
    required this.message,
    required this.priority,
    required this.projectSiteId,
    required this.projectSiteLocation,
    required this.projectSiteName,
    required this.projectKey,
    required this.remarks,
    required this.requestedBy,
    required this.saNumber,
    required this.sales,
    required this.serviceDuration,
    required this.serviceExpenses,
    required this.serviceType,
    required this.status,
    required this.technology,
    required this.updated,
  });

  factory ServiceAssignment.fromJson(Map<String, dynamic> json) {
    return ServiceAssignment(
      id: json['id'] ?? '',
      alarmDate: json['alarmDate'],
      alarmTime: json['alarmTime'] ?? '',
      assignedTo: json['assignedTo'] ?? '',
      assignedToName: json['assignedToName'] ?? '',
      attachments: json['attachments'] ?? [],
      companyId: json['company_id'] ?? '',
      coveredDateEnd: json['coveredDateEnd'],
      coveredDateStart: json['coveredDateStart'],
      created: json['created'],
      crew: json['crew'] ?? '',
      equipmentRequired: json['equipmentRequired'] ?? '',
      gondola: json['gondola'] ?? '',
      illuminationNits: json['illuminationNits'] ?? '',
      joNumber: json['joNumber'] ?? '',
      jobOrderId: json['jobOrderId'] ?? '',
      materialSpecs: json['materialSpecs'] ?? '',
      message: json['message'] ?? '',
      priority: json['priority'] ?? '',
      projectSiteId: json['projectSiteId'] ?? '',
      projectSiteLocation: json['projectSiteLocation'] ?? '',
      projectSiteName: json['projectSiteName'] ?? '',
      projectKey: json['project_key'] ?? '',
      remarks: json['remarks'] ?? '',
      requestedBy: json['requestedBy'] != null ? RequestedBy.fromJson(json['requestedBy']) : RequestedBy(department: '', id: '', name: ''),
      saNumber: json['saNumber'] ?? '',
      sales: json['sales'] ?? '',
      serviceDuration: json['serviceDuration'] ?? '',
      serviceExpenses: json['serviceExpenses'] ?? [],
      serviceType: json['serviceType'] ?? '',
      status: json['status'] ?? '',
      technology: json['technology'] ?? '',
      updated: json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alarmDate': alarmDate,
      'alarmTime': alarmTime,
      'assignedTo': assignedTo,
      'assignedToName': assignedToName,
      'attachments': attachments,
      'company_id': companyId,
      'coveredDateEnd': coveredDateEnd,
      'coveredDateStart': coveredDateStart,
      'created': created,
      'crew': crew,
      'equipmentRequired': equipmentRequired,
      'gondola': gondola,
      'illuminationNits': illuminationNits,
      'joNumber': joNumber,
      'jobOrderId': jobOrderId,
      'materialSpecs': materialSpecs,
      'message': message,
      'priority': priority,
      'projectSiteId': projectSiteId,
      'projectSiteLocation': projectSiteLocation,
      'projectSiteName': projectSiteName,
      'project_key': projectKey,
      'remarks': remarks,
      'requestedBy': requestedBy.toJson(),
      'saNumber': saNumber,
      'sales': sales,
      'serviceDuration': serviceDuration,
      'serviceExpenses': serviceExpenses,
      'serviceType': serviceType,
      'status': status,
      'technology': technology,
      'updated': updated,
    };
  }
}

class User {
  final String uid;
  final String? phoneNumber;
  final String? email;
  final String? displayName;
  final bool? emailVerified;

  User({
    required this.uid,
    this.phoneNumber,
    this.email,
    this.displayName,
    this.emailVerified,
  });

  factory User.fromFirebaseUser(dynamic firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      phoneNumber: firebaseUser.phoneNumber,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      emailVerified: firebaseUser.emailVerified,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      displayName: json['displayName'],
      emailVerified: json['emailVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'email': email,
      'displayName': displayName,
      'emailVerified': emailVerified,
    };
  }
}

class AuthState {
  final User? user;
  final String phoneNumber;
  final String otp;
  final bool isOtpSent;
  final bool loading;

  AuthState({
    this.user,
    required this.phoneNumber,
    required this.otp,
    required this.isOtpSent,
    required this.loading,
  });

  AuthState copyWith({
    User? user,
    String? phoneNumber,
    String? otp,
    bool? isOtpSent,
    bool? loading,
  }) {
    return AuthState(
      user: user ?? this.user,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
      isOtpSent: isOtpSent ?? this.isOtpSent,
      loading: loading ?? this.loading,
    );
  }
}

class CameraState {
  final bool? hasPermission;
  final List<String> photos;
  final bool isGallery;
  final String currentMode; // 'home' | 'camera'
  final bool isAttachingToReport;

  CameraState({
    this.hasPermission,
    required this.photos,
    required this.isGallery,
    required this.currentMode,
    required this.isAttachingToReport,
  });
}

class ReportForm {
  final String title;
  final String description;
  final List<String> photos;

  ReportForm({
    required this.title,
    required this.description,
    required this.photos,
  });
}

class AppState {
  final String currentScreen; // 'home' | 'account'
  final ServiceAssignment? selectedAssignment;
  final bool showDetails;
  final bool showForm;
  final bool isLoadingAssignments;
  final bool isSubmitting;
  final List<ServiceAssignment> serviceAssignments;

  AppState({
    required this.currentScreen,
    this.selectedAssignment,
    required this.showDetails,
    required this.showForm,
    required this.isLoadingAssignments,
    required this.isSubmitting,
    required this.serviceAssignments,
  });
}