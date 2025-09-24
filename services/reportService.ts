import { addDoc, collection, Timestamp } from 'firebase/firestore';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage';
import { db, storage } from '../firebase';
import { ServiceAssignment, User } from '../types';

export const submitReport = async (
  selectedAssignment: ServiceAssignment,
  reportTitle: string,
  reportDescription: string,
  reportPhotos: string[],
  user: User
) => {
  // Upload photos to storage
  const attachments = [];
  for (const uri of reportPhotos) {
    const response = await fetch(uri);
    const blob = await response.blob();
    const filename = `report_${Date.now()}_${Math.random()}.jpg`;
    const storageRef = ref(storage, `reports/${filename}`);
    await uploadBytes(storageRef, blob);
    const downloadURL = await getDownloadURL(storageRef);
    attachments.push({
      fileName: filename,
      fileType: 'image/jpeg',
      fileUrl: downloadURL,
      note: '',
    });
  }

  // Create report object
  const endDate = selectedAssignment.coveredDateEnd?.toDate?.() || (typeof selectedAssignment.coveredDateEnd === 'string' ? new Date(selectedAssignment.coveredDateEnd) : new Date());
  const startDate = selectedAssignment.coveredDateStart?.toDate?.() || (typeof selectedAssignment.coveredDateStart === 'string' ? new Date(selectedAssignment.coveredDateStart) : new Date());

  const report = {
    attachments,
    bookingDates: {
      end: Timestamp.fromDate(endDate),
      start: Timestamp.fromDate(startDate),
      breakdate: Timestamp.fromDate(startDate),
    },
    breakdate: Timestamp.fromDate(startDate),
    category: 'logistics',
    client: selectedAssignment.requestedBy?.name || '',
    clientId: selectedAssignment.requestedBy?.id || '',
    companyId: selectedAssignment.company_id || '',
    completionPercentage: 100,
    created: Timestamp.fromDate(new Date()),
    createdBy: user?.uid || 'user-id',
    createdByName: user?.phoneNumber || 'user-name',
    date: new Date().toISOString().split('T')[0],
    joNumber: selectedAssignment.joNumber || '',
    joType: 'Service',
    location: selectedAssignment.projectSiteLocation || '',
    priority: selectedAssignment.priority || '',
    product: {
      content_type: selectedAssignment.technology || '',
      id: selectedAssignment.projectSiteId || '',
      name: selectedAssignment.projectSiteName || '',
    },
    specs_rental: {},
    reportType: 'Completion Report',
    sales: selectedAssignment.sales || '',
    sellerId: selectedAssignment.assignedTo || '',
    siteId: selectedAssignment.projectSiteId || '',
    siteName: selectedAssignment.projectSiteName || '',
    status: 'posted',
    subcategory: selectedAssignment.serviceType || '',
    tags: ['service-report', selectedAssignment.serviceType || 'Service'],
    updated: Timestamp.fromDate(new Date()),
  };

  await addDoc(collection(db, 'reports'), report);
};