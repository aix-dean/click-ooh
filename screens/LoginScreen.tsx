import React from 'react';
import { View, Text, TouchableOpacity, TextInput, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { authStyles as styles } from '../styles/auth';

interface LoginScreenProps {
  phoneNumber: string;
  setPhoneNumber: (phone: string) => void;
  onSendOtp: () => void;
  loading: boolean;
}

export const LoginScreen: React.FC<LoginScreenProps> = ({
  phoneNumber,
  setPhoneNumber,
  onSendOtp,
  loading,
}) => {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        <View style={styles.loginHeader}>
          <Text style={styles.welcomeTitle}>Welcome Back</Text>
          <Text style={styles.subtitle}>Sign in to continue</Text>
        </View>

        <View style={styles.inputContainer}>
          <Text style={styles.inputLabel}>Phone Number</Text>
          <View style={styles.inputWrapper}>
            <Text style={styles.countryCode}>+63</Text>
            <TextInput
              style={styles.phoneInput}
              placeholder="9XX XXX XXXX"
              value={phoneNumber.replace(/^\+63\s*/, '')}
              onChangeText={(text) => setPhoneNumber('+63 ' + text.replace(/[^\d]/g, ''))}
              keyboardType="phone-pad"
              maxLength={10}
            />
          </View>
        </View>

        <TouchableOpacity style={styles.primaryButton} onPress={onSendOtp} disabled={loading}>
          <Text style={styles.primaryButtonText}>
            {loading ? 'Sending...' : 'Send Verification Code'}
          </Text>
        </TouchableOpacity>

        <View style={styles.divider}>
          <View style={styles.dividerLine} />
          <Text style={styles.dividerText}>Secure Login</Text>
          <View style={styles.dividerLine} />
        </View>

        <Text style={styles.demoText}>
          Enter your phone number to receive a verification code.{'\n'}
          Make sure your device can receive SMS messages.
        </Text>
      </View>
    </SafeAreaView>
  );
};