import 'package:flutter/material.dart';

import '../utils/routes.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();
  bool _isSubmitting = false;

  void _verifyOtp() async {
    final otp = _otpController.text;
    if (otp == "1234") { // Example OTP check
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
              maxLength: 6,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSubmitting ? null : _verifyOtp,
              child: _isSubmitting
                  ? CircularProgressIndicator()
                  : Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
