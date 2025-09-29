import '../types/types.dart';

// Mock user data
const List<Map<String, String>> mockUsers = [
  {'uid': 'mock-user-1', 'phoneNumber': '+639123456789'},
  {'uid': 'mock-user-2', 'phoneNumber': '+639876543210'},
];

// Mock OTP codes for testing
const Map<String, String> mockOtps = {
  '+639123456789': '123456',
  '+639876543210': '654321',
};

class MockConfirmationResult {
  final String phoneNumber;
  final User user;

  MockConfirmationResult(this.phoneNumber, this.user);

  Future<Map<String, dynamic>> confirm(String otp) async {
    // Check if OTP is valid for this phone number
    final expectedOtp = mockOtps[phoneNumber];
    if (otp != expectedOtp) {
      throw Exception('Invalid verification code');
    }

    // Simulate successful verification
    return {
      'user': user,
    };
  }
}

class MockAuth {
  User? _currentUser;
  MockConfirmationResult? _confirmationResult;

  // Simulate auth state listener
  void onAuthStateChanged(Function(User? user) callback) {
    // For simplicity, no real listener
  }

  // Mock sign in with phone number
  Future<MockConfirmationResult> signInWithPhoneNumber(String phoneNumber) async {
    // Validate phone number format
    if (!phoneNumber.startsWith('+63') || phoneNumber.length != 13) {
      throw Exception('Invalid phone number format');
    }

    // Check if user exists in mock data
    final userData = mockUsers.firstWhere(
      (u) => u['phoneNumber'] == phoneNumber,
      orElse: () => {},
    );

    if (userData.isEmpty) {
      throw Exception('Phone number not registered in mock data');
    }

    final user = User(
      uid: userData['uid']!,
      phoneNumber: userData['phoneNumber'],
    );

    // Create mock confirmation result
    _confirmationResult = MockConfirmationResult(phoneNumber, user);
    return _confirmationResult!;
  }

  // Mock sign out
  Future<void> signOut() async {
    _currentUser = null;
    _confirmationResult = null;
  }

  // Get current user
  User? getCurrentUser() {
    return _currentUser;
  }

  // Set current user (for testing)
  void setCurrentUser(User? user) {
    _currentUser = user;
  }
}

// Export singleton instance
final mockAuth = MockAuth();

// Mock reCAPTCHA verifier (no-op)
class MockRecaptchaVerifier {
  MockRecaptchaVerifier(String container, [Map<String, dynamic>? options]);

  Future<int> render() async {
    return 0;
  }

  void clear() {}
}