import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<String?> login() async {
    if (emailController.text.isEmpty) {
      return "Please enter your email.";
    }
    if (passwordController.text.isEmpty) {
      return "Please enter your password.";
    }

    isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString('userEmail');
    final storedPassword = prefs.getString('userPassword');

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    if (storedEmail == null) {
      return "No account found. Please sign up first.";
    }

    if (emailController.text != storedEmail) {
      return "No account found with this email.";
    }

    if (storedPassword == null) {
      return "Password not found. Please sign up again.";
    }

    if (passwordController.text != storedPassword) {
      return "Incorrect password.";
    }

    // تسجيل الدخول بنجاح
    await prefs.setBool('isLoggedIn', true);
    return null; // نجاح
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
