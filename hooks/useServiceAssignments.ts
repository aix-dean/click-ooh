import { useState, useEffect } from 'react';
import { collection, getDocs } from 'firebase/firestore';
import { db } from '../firebase';
import { ServiceAssignment, User } from '../types';

export const useServiceAssignments = (user: User | null) => {
  const [serviceAssignments, setServiceAssignments] = useState<ServiceAssignment[]>([]);
  const [isLoadingAssignments, setIsLoadingAssignments] = useState(false);

  useEffect(() => {
    if (user) {
      const fetchAssignments = async () => {
        setIsLoadingAssignments(true);
        try {
          // Simulate network delay for demo
          await new Promise(resolve => setTimeout(resolve, 1500));
          const querySnapshot = await getDocs(collection(db, 'service_assignments'));
          const assignments: ServiceAssignment[] = [];
          querySnapshot.forEach((doc: any) => {
            assignments.push({ id: doc.id, ...doc.data() } as ServiceAssignment);
          });
          setServiceAssignments(assignments);
        } catch (error) {
          console.error('Error fetching assignments:', error);
          throw new Error('Failed to load service assignments');
        } finally {
          setIsLoadingAssignments(false);
        }
      };
      fetchAssignments();
    }
  }, [user]);

  return {
    serviceAssignments,
    isLoadingAssignments,
  };
};