import React from 'react';
import { View, Text, TouchableOpacity, TextInput, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { authStyles as styles } from '../styles/auth';

interface OtpScreenProps {
  phoneNumber: string;
  otp: string;
  setOtp: (otp: string) => void;
  onVerifyOtp: () => void;
  onChangePhoneNumber: () => void;
  onResendOtp: () => void;
  loading: boolean;
}

export const OtpScreen: React.FC<OtpScreenProps> = ({
  phoneNumber,
  otp,
  setOtp,
  onVerifyOtp,
  onChangePhoneNumber,
  onResendOtp,
  loading,
}) => {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        <View style={styles.otpHeader}>
          <Text style={styles.otpTitle}>Verify Phone</Text>
          <Text style={styles.otpSubtitle}>
            We've sent a 6-digit code to{'\n'}
            <Text style={styles.phoneDisplay}>{phoneNumber}</Text>
          </Text>
        </View>

        <View style={styles.otpContainer}>
          <TextInput
            style={styles.otpInput}
            placeholder="000000"
            value={otp}
            onChangeText={setOtp}
            keyboardType="number-pad"
            maxLength={6}
            textAlign="center"
          />
        </View>

        <TouchableOpacity style={styles.primaryButton} onPress={onVerifyOtp} disabled={loading}>
          <Text style={styles.primaryButtonText}>
            {loading ? 'Verifying...' : 'Verify & Continue'}
          </Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.secondaryButton} onPress={onChangePhoneNumber}>
          <Text style={styles.secondaryButtonText}>Change Phone Number</Text>
        </TouchableOpacity>

        <Text style={styles.resendText}>
          Didn't receive the code?{' '}
          <Text
            style={styles.resendLink}
            onPress={onResendOtp}
          >
            Resend
          </Text>
        </Text>
      </View>
    </SafeAreaView>
  );
};