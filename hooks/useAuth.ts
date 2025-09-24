import { useState, useEffect } from 'react';
import { User, AuthState } from '../types';
import { mockAuth, MockRecaptchaVerifier } from '../utils/mockAuth';

// Extend Window interface for reCAPTCHA
declare global {
  interface Window {
    recaptchaVerifier: MockRecaptchaVerifier;
  }
}

export const useAuth = () => {
  const [user, setUser] = useState<User | null>(null);
  const [phoneNumber, setPhoneNumber] = useState('');
  const [otp, setOtp] = useState('');
  const [isOtpSent, setIsOtpSent] = useState(false);
  const [confirmationResult, setConfirmationResult] = useState<any>(null);
  const [loading, setLoading] = useState(false);

  // Listen to authentication state changes
  useEffect(() => {
    const checkAuthState = () => {
      const currentUser = mockAuth.getCurrentUser();
      if (currentUser) {
        setUser(currentUser);
      } else {
        setUser(null);
      }
    };

    // Check auth state initially
    checkAuthState();

    // For mock auth, we don't need a real listener
    // but we'll check periodically for demo purposes
    const interval = setInterval(checkAuthState, 1000);

    return () => clearInterval(interval);
  }, []);

  const sendOtp = async (number: string) => {
    if (!number.trim() || number.length < 8) {
      throw new Error('Please enter a valid phone number');
    }

    setLoading(true);
    try {
      // Initialize mock reCAPTCHA verifier (only once)
      if (!window.recaptchaVerifier) {
        window.recaptchaVerifier = new MockRecaptchaVerifier('recaptcha-container', {
          size: 'invisible',
        });
      }

      const formattedNumber = number.startsWith('+') ? number : `+${number}`;
      const result = await mockAuth.signInWithPhoneNumber(formattedNumber);
      setConfirmationResult(result);
      setPhoneNumber(formattedNumber);
      setIsOtpSent(true);
      return 'OTP sent successfully (use 123456 or 654321 for testing)';
    } catch (error: any) {
      console.error('Error sending OTP:', error);
      throw new Error(error.message || 'Failed to send OTP');
    } finally {
      setLoading(false);
    }
  };

  const verifyOtp = async (code: string) => {
    if (!confirmationResult) {
      throw new Error('No OTP request found');
    }

    if (code.length !== 6) {
      throw new Error('Please enter a 6-digit code');
    }

    setLoading(true);
    try {
      const result = await confirmationResult.confirm(code);
      // Set the authenticated user
      mockAuth.setCurrentUser(result.user);
      return true;
    } catch (error: any) {
      console.error('Error verifying OTP:', error);
      throw new Error(error.message || 'Invalid verification code');
    } finally {
      setLoading(false);
    }
  };

  const changePhoneNumber = () => {
    setIsOtpSent(false);
    setOtp('');
    setConfirmationResult(null);
  };

  const logout = async () => {
    try {
      await mockAuth.signOut();
      setUser(null);
      setPhoneNumber('');
      setOtp('');
      setIsOtpSent(false);
      setConfirmationResult(null);
    } catch (error) {
      console.error('Error signing out:', error);
    }
  };

  const authState: AuthState = {
    user,
    phoneNumber,
    otp,
    isOtpSent,
    loading,
  };

  return {
    authState,
    setPhoneNumber,
    setOtp,
    sendOtp,
    verifyOtp,
    changePhoneNumber,
    logout,
  };
};