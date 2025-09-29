import { StyleSheet } from 'react-native';

export const authStyles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    backgroundColor: '#f8f9fa',
  },
  container: {
    flex: 1,
    backgroundColor: '#f8f9fa',
  },
  // Login UI Styles
  loginHeader: {
    alignItems: 'center',
    marginBottom: 40,
  },
  welcomeTitle: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#007bff',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: '#6c757d',
    textAlign: 'center',
  },
  inputContainer: {
    marginBottom: 30,
  },
  inputLabel: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    marginBottom: 8,
  },
  inputWrapper: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#e0e0e0',
    borderRadius: 12,
    backgroundColor: '#ffffff',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  countryCode: {
    fontSize: 16,
    fontWeight: '600',
    color: '#007bff',
    paddingHorizontal: 16,
    paddingVertical: 16,
  },
  phoneInput: {
    flex: 1,
    fontSize: 16,
    paddingVertical: 16,
    paddingRight: 16,
    color: '#333',
  },
  primaryButton: {
    backgroundColor: '#007bff',
    borderRadius: 12,
    paddingVertical: 16,
    alignItems: 'center',
    shadowColor: '#007bff',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.3,
    shadowRadius: 4,
    elevation: 5,
    marginBottom: 20,
  },
  primaryButtonText: {
    color: '#ffffff',
    fontSize: 16,
    fontWeight: '600',
  },
  secondaryButton: {
    backgroundColor: 'transparent',
    borderRadius: 12,
    paddingVertical: 16,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#007bff',
    marginBottom: 20,
  },
  secondaryButtonText: {
    color: '#007bff',
    fontSize: 16,
    fontWeight: '600',
  },
  divider: {
    flexDirection: 'row',
    alignItems: 'center',
    marginVertical: 20,
  },
  dividerLine: {
    flex: 1,
    height: 1,
    backgroundColor: '#e0e0e0',
  },
  dividerText: {
    paddingHorizontal: 16,
    fontSize: 14,
    color: '#6c757d',
    fontWeight: '500',
  },
  demoText: {
    fontSize: 14,
    color: '#6c757d',
    textAlign: 'center',
    lineHeight: 20,
  },
  // OTP Page Styles
  otpHeader: {
    alignItems: 'center',
    marginBottom: 40,
  },
  otpTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#007bff',
    marginBottom: 8,
  },
  otpSubtitle: {
    fontSize: 16,
    color: '#6c757d',
    textAlign: 'center',
    lineHeight: 22,
  },
  phoneDisplay: {
    fontWeight: '600',
    color: '#333',
  },
  otpContainer: {
    marginBottom: 30,
  },
  otpInput: {
    fontSize: 24,
    fontWeight: 'bold',
    letterSpacing: 8,
    textAlign: 'center',
    paddingVertical: 20,
    paddingHorizontal: 40,
    borderWidth: 2,
    borderColor: '#007bff',
    borderRadius: 12,
    backgroundColor: '#ffffff',
    color: '#333',
  },
  resendText: {
    fontSize: 14,
    color: '#6c757d',
    textAlign: 'center',
  },
  resendLink: {
    color: '#007bff',
    fontWeight: '600',
  },
});