import React, { useState, useEffect } from 'react';
import { View, Text, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';

// Import types
import { ServiceAssignment, User } from './types';

// Import hooks
import { useAuth } from './hooks/useAuth';
import { useServiceAssignments } from './hooks/useServiceAssignments';

// Import screens
import { LoginScreen } from './screens/LoginScreen';
import { OtpScreen } from './screens/OtpScreen';
import { HomeScreen } from './screens/HomeScreen';
import { AccountScreen } from './screens/AccountScreen';
import { ServiceAssignmentDetailsScreen } from './screens/ServiceAssignmentDetailsScreen';
import { CreateReportScreen } from './screens/CreateReportScreen';

// Import components
import { BottomNavigation } from './components/BottomNavigation';

// Import styles
import { mainStyles as styles } from './styles/main';

export default function App() {
  // App-level state
  const [isSplashVisible, setIsSplashVisible] = useState(true);
  const [currentScreen, setCurrentScreen] = useState<'home' | 'account'>('home');
  const [selectedAssignment, setSelectedAssignment] = useState<ServiceAssignment | null>(null);
  const [showDetails, setShowDetails] = useState(false);
  const [showCreateReport, setShowCreateReport] = useState(false);

  // Custom hooks
  const { authState, setPhoneNumber, setOtp, sendOtp, verifyOtp, changePhoneNumber, logout } = useAuth();
  const { serviceAssignments, isLoadingAssignments } = useServiceAssignments(authState.user);

  // Splash screen timer
  useEffect(() => {
    const timer = setTimeout(() => setIsSplashVisible(false), 2000);
    return () => clearTimeout(timer);
  }, []);

  // Authentication handlers
  const handleSendOtp = async () => {
    try {
      await sendOtp(authState.phoneNumber);
      Alert.alert('OTP Sent', 'Please check your phone for the verification code.', [
        { text: 'OK', style: 'default' }
      ]);
    } catch (error: any) {
      Alert.alert('Error', error.message);
    }
  };

  const handleVerifyOtp = async () => {
    try {
      await verifyOtp(authState.otp);
      Alert.alert('Success', 'Welcome to click ooh!', [
        { text: 'Continue', style: 'default' }
      ]);
    } catch (error: any) {
      Alert.alert('Invalid Code', error.message, [
        { text: 'Try Again', style: 'default' }
      ]);
    }
  };

  const handleResendOtp = async () => {
    try {
      await sendOtp(authState.phoneNumber);
      Alert.alert('OTP Resent', 'Please check your phone for the new verification code.', [
        { text: 'OK', style: 'default' }
      ]);
    } catch (error: any) {
      Alert.alert('Error', error.message);
    }
  };

  const handleLogout = () => {
    logout();
    setCurrentScreen('home');
  };

  const handleAssignmentPress = (assignment: ServiceAssignment) => {
    setSelectedAssignment(assignment);
    setShowDetails(true);
  };

  const handleCreateReport = () => {
    setShowCreateReport(true);
  };

  const handleReportSubmitted = () => {
    setShowCreateReport(false);
    setShowDetails(false);
    setSelectedAssignment(null);
  };

  const handleBackFromDetails = () => {
    setShowDetails(false);
    setSelectedAssignment(null);
  };

  const handleBackFromCreateReport = () => {
    setShowCreateReport(false);
  };

  // Render splash screen
  if (isSplashVisible) {
    return (
      <SafeAreaView style={styles.safeContainer}>
        <View style={styles.splashContainer}>
          <Text style={styles.splashText}>click ooh</Text>
        </View>
      </SafeAreaView>
    );
  }

  // Render authentication screens
  if (!authState.user) {
    if (!authState.isOtpSent) {
      return (
        <LoginScreen
          phoneNumber={authState.phoneNumber}
          setPhoneNumber={setPhoneNumber}
          onSendOtp={handleSendOtp}
          loading={authState.loading}
        />
      );
    } else {
      return (
        <OtpScreen
          phoneNumber={authState.phoneNumber}
          otp={authState.otp}
          setOtp={setOtp}
          onVerifyOtp={handleVerifyOtp}
          onChangePhoneNumber={changePhoneNumber}
          onResendOtp={handleResendOtp}
          loading={authState.loading}
        />
      );
    }
  }

  // Render create report screen (prioritize over details)
  if (showCreateReport && selectedAssignment) {
    return (
      <CreateReportScreen
        assignment={selectedAssignment}
        user={authState.user!}
        onBack={handleBackFromCreateReport}
        onReportSubmitted={handleReportSubmitted}
      />
    );
  }

  // Render assignment details
  if (showDetails && selectedAssignment) {
    return (
      <ServiceAssignmentDetailsScreen
        assignment={selectedAssignment}
        onCreateReport={handleCreateReport}
        onBack={handleBackFromDetails}
      />
    );
  }

  // Render main app with navigation
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        {currentScreen === 'home' ? (
          <HomeScreen
            serviceAssignments={serviceAssignments}
            isLoadingAssignments={isLoadingAssignments}
            user={authState.user}
            onAssignmentPress={handleAssignmentPress}
            onLogout={handleLogout}
          />
        ) : (
          <AccountScreen
            user={authState.user}
            onLogout={handleLogout}
          />
        )}

        <BottomNavigation
          currentScreen={currentScreen}
          onScreenChange={setCurrentScreen}
        />
      </View>
      <StatusBar style="auto" />
    </SafeAreaView>
  );
}
