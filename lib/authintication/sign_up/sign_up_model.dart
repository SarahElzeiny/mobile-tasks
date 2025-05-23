import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:section/profile/user model.dart';
import 'package:provider/provider.dart';

class SignupViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  // Toggle visibility for password fields
  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  // Dispose controllers
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // Validation methods
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!value.contains('@')) return 'Please enter a valid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  // Signup logic with storing email and password
  Future<bool> signUp(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();

    // Store login state, email, and password
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', emailController.text);
    await prefs.setString('userPassword', passwordController.text);

    // Create default user model
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.createDefaultUser(emailController.text);

    isLoading = false;
    notifyListeners();

    return true;
  }
}
