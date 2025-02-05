import 'package:flutter/material.dart';
import '../view/screen/home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureRePassword = true;
  bool _acceptTerms = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  // ألوان مخصصة للتطبيق
  final Color _primaryColor = const Color(0xFF6C63FF);
  final Color _accentColor = const Color(0xFFFFD500);
  final Color _backgroundColor = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FlutterLogo(
                      size: 120,
                      style: FlutterLogoStyle.stacked,
                      textColor: _primaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _primaryColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'انضم إلينا واستمتع بكل المميزات',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildInputField(
                    label: 'الاسم الكامل',
                    controller: _nameController,
                    icon: Icons.person_outline,
                    validator: (value) => value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: 'البريد الإلكتروني',
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => !value!.contains('@') ? 'بريد إلكتروني غير صالح' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildPasswordField(
                    label: 'كلمة المرور',
                    controller: _passwordController,
                    validator: (value) => value!.length < 8 ? 'كلمة المرور يجب أن تكون 8 أحرف على الأقل' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildPasswordField(
                    label: 'تأكيد كلمة المرور',
                    controller: _rePasswordController,
                    isConfirmation: true,
                    validator: (value) => value != _passwordController.text ? 'كلمات المرور غير متطابقة' : null,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptTerms,
                        activeColor: _primaryColor,
                        onChanged: (value) => setState(() => _acceptTerms = value!),
                      ),
                      Expanded(
                        child: Wrap(
                          children: [
                            const Text('أوافق على '),
                            GestureDetector(
                              onTap: () {/* إضافة شروط الاستخدام */},
                              child: Text(
                                'الشروط والأحكام',
                                style: TextStyle(
                                  color: _primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // زر إنشاء الحساب
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        'تسجيل حساب جديد',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  // رابط تسجيل الدخول
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'لديك حساب بالفعل؟ ',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: 'تسجيل الدخول',
                              style: TextStyle(
                                color: _primaryColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey[500]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            errorStyle: const TextStyle(height: 0.8),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    bool isConfirmation = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isConfirmation ? _obscureRePassword : _obscurePassword,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[500]),
            suffixIcon: IconButton(
              icon: Icon(
                isConfirmation
                    ? _obscureRePassword ? Icons.visibility_off : Icons.visibility
                    : _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[500],
              ),
              onPressed: () => setState(() {
                if (isConfirmation) {
                  _obscureRePassword = !_obscureRePassword;
                } else {
                  _obscurePassword = !_obscurePassword;
                }
              }),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            errorStyle: const TextStyle(height: 0.8),
          ),
          validator: validator,
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      if (_passwordController.text == _rePasswordController.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمات المرور غير متطابقة')),
        );
      }
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء الموافقة على الشروط والأحكام')),
      );
    }
  }
}