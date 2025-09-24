import { User } from '../types';

// Mock user data
const MOCK_USERS = [
  { uid: 'mock-user-1', phoneNumber: '+639123456789' },
  { uid: 'mock-user-2', phoneNumber: '+639876543210' },
];

// Mock OTP codes for testing
const MOCK_OTPS = {
  '+639123456789': '123456',
  '+639876543210': '654321',
};

class MockAuth {
  private currentUser: User | null = null;
  private confirmationResult: MockConfirmationResult | null = null;

  // Simulate auth state listener
  onAuthStateChanged(callback: (user: User | null) => void): () => void {
    // Return unsubscribe function
    return () => {};
  }

  // Mock sign in with phone number
  async signInWithPhoneNumber(phoneNumber: string): Promise<MockConfirmationResult> {
    // Validate phone number format
    if (!phoneNumber.startsWith('+63') || phoneNumber.length !== 13) {
      throw new Error('Invalid phone number format');
    }

    // Check if user exists in mock data
    const user = MOCK_USERS.find(u => u.phoneNumber === phoneNumber);
    if (!user) {
      throw new Error('Phone number not registered in mock data');
    }

    // Create mock confirmation result
    this.confirmationResult = new MockConfirmationResult(phoneNumber, user);
    return this.confirmationResult;
  }

  // Mock sign out
  async signOut(): Promise<void> {
    this.currentUser = null;
    this.confirmationResult = null;
  }

  // Get current user
  getCurrentUser(): User | null {
    return this.currentUser;
  }

  // Set current user (for testing)
  setCurrentUser(user: User | null): void {
    this.currentUser = user;
  }
}

class MockConfirmationResult {
  constructor(private phoneNumber: string, private user: User) {}

  async confirm(otp: string): Promise<any> {
    // Check if OTP is valid for this phone number
    const expectedOtp = MOCK_OTPS[this.phoneNumber as keyof typeof MOCK_OTPS];
    if (otp !== expectedOtp) {
      throw new Error('Invalid verification code');
    }

    // Simulate successful verification
    return {
      user: this.user,
    };
  }
}

// Export singleton instance
export const mockAuth = new MockAuth();

// Mock reCAPTCHA verifier (no-op)
export class MockRecaptchaVerifier {
  constructor(container: string, options?: any) {}

  render(): Promise<number> {
    return Promise.resolve(0);
  }

  clear(): void {}
}

// Export types for compatibility
export type { User };