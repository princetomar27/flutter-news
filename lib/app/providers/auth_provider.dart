import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  User? _user;
  String? _errorMessage;

  User? get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> signUp(String email, String password, String name) async {
    try {
      _user = await _authRepository.signUp(email, password, name);

      if (_user != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isUserLoggedIn", true);
      }

      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      throw Exception(_errorMessage);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _user = await _authRepository.signIn(email, password);

      if (_user != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isUserLoggedIn", true);
      }

      notifyListeners();
    } on FirebaseAuthException catch (err) {
      String msg = '';
      if (err.code == 'invalid-email') {
        msg = 'Email is invalid';
      } else if (err.code == 'wrong-password') {
        msg = 'Try with a different password';
      }
      notifyListeners();
      throw Exception(msg);
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isUserLoggedIn", false);

    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isUserLoggedIn") ?? false;
  }
}
