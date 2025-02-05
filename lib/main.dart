// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ppppppp/view/profile/profile_screen.dart';
import 'package:ppppppp/view/screen/add_patient.dart';
import 'package:ppppppp/view/screen/reservations/book_now.dart';
import 'package:ppppppp/view/screen/reservations/confirm_booking.dart';
import 'package:ppppppp/view/screen/reservations/proceed_screen.dart';
import 'package:provider/provider.dart';
import 'package:ppppppp/view/screen/home_screen.dart';
import 'package:ppppppp/themes/app_theme.dart';
import 'package:ppppppp/auth/sigupcreate.dart';
import 'package:ppppppp/auth/login.dart';
import 'package:ppppppp/auth/ForgotPasswordScreen.dart';
import 'package:ppppppp/intro/intro_page1.dart';
import 'package:ppppppp/intro/intro_page2.dart';
import 'package:ppppppp/providers/medical_provider.dart';    // استيراد مزود الخدمات الطبية

// استيراد صفحة المواعيد
import 'package:ppppppp/view/screen/appointments/my_appointments_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MedicalProvider()), // توفير MedicalProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // الوضع الافتراضي للثيم

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Themed App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode, // تطبيق وضع الثيم
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
      routes: {
        '/': (context) => const Splash(),
        '/intro1': (context) => IntroPage1(toggleTheme: _toggleTheme),
        '/intro2': (context) => IntroPage2(toggleTheme: _toggleTheme),
        '/login': (context) => Login(),
        '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/sigupcreate': (context) => SignUpPage(),
        '/home_screen': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        // أضفنا مسار صفحة المواعيد
        '/my_appointments': (context) => const MyAppointmentsScreen(),
        '/book_now': (context) => const BookNowScreen(),
        '/confirm_booking': (context) => const ConfirmBookingScreen(),
        '/proceed_screen': (context) => const ProceedScreen(),
        '/add_patient': (context) => const AddPatientScreen(),

      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToIntro();
  }

  _navigateToIntro() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, '/intro1');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'assets/images/log.jpg',
                height: 300,
                width: 300,
              ),
            ),
            const Text(
              "food",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
