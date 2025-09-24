// Firebase configuration
// Firebase initialization for Firestore and Storage (Auth removed)

import { initializeApp } from 'firebase/app';
import { getStorage } from 'firebase/storage';
import { getFirestore } from 'firebase/firestore';

// Your Firebase configuration (replace with your actual config from Firebase console)
const firebaseConfig = {
  apiKey: "AIzaSyDk_a7lPHqJBRI2TzxTIMiSPj-E7Xyqizs",
  authDomain: "oh-app-bcf24.firebaseapp.com",
  projectId: "oh-app-bcf24",
  storageBucket: "oh-app-bcf24.appspot.com",
  messagingSenderId: "272363630855",
  appId: "1:272363630855:web:bf9ea9d5683e2596d915a2",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

export const storage = getStorage(app);

// Initialize Firestore
export const db = getFirestore(app);

export default app;