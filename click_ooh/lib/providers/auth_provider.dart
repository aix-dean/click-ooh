import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../types/types.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String _phoneNumber = '';
  String _otp = '';
  bool _isOtpSent = false;
  firebase_auth.ConfirmationResult? _confirmationResult;
  bool _loading = false;
  StreamSubscription<firebase_auth.User?>? _authStateSubscription;

  User? get user => _user;
  String get phoneNumber => _phoneNumber;
  String get otp => _otp;
  bool get isOtpSent => _isOtpSent;
  bool get loading => _loading;

  AuthState get authState => AuthState(
        user: _user,
        phoneNumber: _phoneNumber,
        otp: _otp,
        isOtpSent: _isOtpSent,
        loading: _loading,
      );

  AuthProvider() {
    _initAuthStateListener();
  }

  void _initAuthStateListener() {
    _authStateSubscription = firebase_auth.FirebaseAuth.instance.authStateChanges().listen((firebase_auth.User? firebaseUser) {
      if (firebaseUser != null) {
        _user = User.fromFirebaseUser(firebaseUser);
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  Future<void> sendOtp(String number) async {
    if (number.trim().isEmpty || number.length < 8) {
      throw Exception('Please enter a valid phone number');
    }

    _loading = true;
    notifyListeners();

    try {
      final formattedNumber = number.startsWith('+') ? number : '+$number';
      _confirmationResult = await firebase_auth.FirebaseAuth.instance.signInWithPhoneNumber(formattedNumber);
      _phoneNumber = formattedNumber;
      _isOtpSent = true;
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp(String code) async {
    if (_confirmationResult == null) {
      throw Exception('No OTP request found');
    }

    if (code.length != 6) {
      throw Exception('Please enter a 6-digit code');
    }

    _loading = true;
    notifyListeners();

    try {
      await _confirmationResult!.confirm(code);
      // Firebase auth state listener will handle updating the user
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void changePhoneNumber() {
    _isOtpSent = false;
    _otp = '';
    _confirmationResult = null;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await firebase_auth.FirebaseAuth.instance.signOut();
      _phoneNumber = '';
      _otp = '';
      _isOtpSent = false;
      _confirmationResult = null;
      // Firebase auth state listener will handle setting _user to null
    } catch (error) {
      // Handle error
    }
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setOtp(String value) {
    _otp = value;
    notifyListeners();
  }
}