// verification_screen.dart
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _codeControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  int _countdown = 30;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _countdown > 0) {
        setState(() => _countdown--);
        _startCountdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تأكيد الحساب'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Icon(
              Icons.verified_outlined,
              size: 100,
              color: primaryColor,
            ),
            const SizedBox(height: 30),
            Text(
              'تم إرسال رمز التحقق إلى',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.email,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildCodeInputFields(primaryColor),
            const SizedBox(height: 20),
            _buildCountdownText(),
            const SizedBox(height: 30),
            _buildVerifyButton(primaryColor),
            const SizedBox(height: 20),
            _buildResendCodeButton(primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInputFields(Color primaryColor) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 60,
            child: TextField(
              controller: _codeControllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 3) {
                  _focusNodes[index + 1].requestFocus();
                }
                if (value.isEmpty && index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCountdownText() {
    return Text(
      'يمكنك إعادة الإرسال بعد $_countdown ثانية',
      style: TextStyle(
        color: _countdown > 0 ? Colors.grey : Colors.green,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildVerifyButton(Color primaryColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _verifyCode,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
          'تحقق',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildResendCodeButton(Color primaryColor) {
    return TextButton(
      onPressed: _countdown > 0 ? null : () {
        setState(() => _countdown = 30);
        _startCountdown();
      },
      child: Text(
        'إعادة إرسال الرمز',
        style: TextStyle(
          color: _countdown > 0 ? Colors.grey : primaryColor,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _verifyCode() async {
    final code = _codeControllers.map((c) => c.text).join();
    if (code.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال الرمز بالكامل')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // محاكاة عملية التحقق
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (code == '1234') { // استبدل بالمنطق الفعلي للتحقق
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رمز التحقق غير صحيح')),
      );
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}