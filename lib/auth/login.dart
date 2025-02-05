import 'package:flutter/material.dart';
import 'package:ppppppp/auth/sigupcreate.dart';
import 'package:ppppppp/constant/share/appber.dart';
import 'ForgotPasswordScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ألوان مخصصة
  final Color _primaryColor = const Color(0xFF0F01D3);
  final Color _accentColor = const Color(0xFFFFD500);
  final Color _backgroundColor = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'تسجيل الدخول',
        backRoute: '/login',
        textColor: _primaryColor,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: _backgroundColor,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildWelcomeText(context),
                          const SizedBox(height: 40),
                          _buildEmailInputField(),
                          const SizedBox(height: 20),
                          _buildPasswordInputField(),
                          _buildForgotPasswordButton(context),
                          const SizedBox(height: 20),
                          _buildLoginButton(context),
                          const SizedBox(height: 20),
                          _buildSocialLoginSection(),
                          const Spacer(),
                          _buildCreateAccountRow(context),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.account_circle_rounded,
          size: 100,
          color: _primaryColor,
        ),
        const SizedBox(height: 20),
        Text(
          'مرحبًا بعودتك!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'سجل الدخول لاستئناف تجربتك',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInputField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: "البريد الإلكتروني",
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value!.isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
        if (!value.contains('@')) return 'بريد إلكتروني غير صالح';
        return null;
      },
    );
  }

  Widget _buildPasswordInputField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        hintText: 'كلمة المرور',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value!.isEmpty) return 'الرجاء إدخال كلمة المرور';
        if (value.length < 8) return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
        return null;
      },
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ForgotPasswordScreen()),
        ),
        child: Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(
            color: _primaryColor,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
        ),
        child: const Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSocialLoginSection() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('أو'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => print('تسجيل الدخول عبر جوجل'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
         // icon: Image.asset('assets/images/dec1.jpg', height: 5,width: 10,),
          label: const Text('متابعة عبر جوجل'),
        ),
      ],
    );
  }

  Widget _buildCreateAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ليس لديك حساب؟'),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          ),
          child: Text(
            'إنشاء حساب جديد',
            style: TextStyle(
              color: _primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }
}