export interface ServiceAssignment {
  id: string;
  alarmDate: any;
  alarmTime: string;
  assignedTo: string;
  assignedToName: string;
  attachments: any[];
  company_id: string;
  coveredDateEnd: any;
  coveredDateStart: any;
  created: any;
  crew: string;
  equipmentRequired: string;
  gondola: string;
  illuminationNits: string;
  joNumber: string;
  jobOrderId: string;
  materialSpecs: string;
  message: string;
  priority: string;
  projectSiteId: string;
  projectSiteLocation: string;
  projectSiteName: string;
  project_key: string;
  remarks: string;
  requestedBy: {
    department: string;
    id: string;
    name: string;
  };
  saNumber: string;
  sales: string;
  serviceDuration: string;
  serviceExpenses: any[];
  serviceType: string;
  status: string;
  technology: string;
  updated: any;
}

export interface User {
  uid: string;
  phoneNumber?: string;
}

export interface AuthState {
  user: User | null;
  phoneNumber: string;
  otp: string;
  isOtpSent: boolean;
  loading: boolean;
}

export interface CameraState {
  hasPermission: boolean | null;
  photos: string[];
  isGallery: boolean;
  currentMode: 'home' | 'camera';
  isAttachingToReport: boolean;
}

export interface ReportForm {
  title: string;
  description: string;
  photos: string[];
}

export interface AppState {
  currentScreen: 'home' | 'account';
  selectedAssignment: ServiceAssignment | null;
  showDetails: boolean;
  showForm: boolean;
  isLoadingAssignments: boolean;
  isSubmitting: boolean;
  serviceAssignments: ServiceAssignment[];
}