// import 'package:applicationaqars/function/chingpages.dart';
// import 'package:applicationaqars/view/screen/profileusers/callus.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SupportPage extends StatelessWidget {
//   const SupportPage({super.key});
  

//   final int _currentIndex = 2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F7F7),
//       appBar: AppBar(
//         title: const Text(
//           'المساعدة والدعم',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF354B9F),
//                 Color(0xFF25346E),
//                 Color(0xFF25346E),
//                 Color(0xFF131B39),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildHeader(),
//             const SizedBox(height: 30.0),
//             ..._buildButtons(context),
//             _buildLogo(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: buildBottomNavigationBar(context, _currentIndex),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       children: [
//         const Text(
//           'هل تحتاج الى مساعدة؟',
//           style: TextStyle(fontSize: 18),
//         ),
//         const SizedBox(height: 15.0),
//         Text(
//           'تواصل معنا الآن',
//           style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.67)),
//         ),
//       ],
//     );
//   }

//   List<Widget> _buildButtons(BuildContext context) {
//     final List<Map<String, dynamic>> buttonsData = [
//       {
//         'icon': FontAwesomeIcons.headset,
//         'color': const Color.fromARGB(255, 18, 72, 126),
//         'text': 'فريق الدعم',
//         'page': const SupportTeamPage(), // الصفحة الخاصة بفريق الدعم
//       },
//       {
//         'icon': Icons.handshake_outlined,
//         'color': const Color.fromARGB(255, 154, 153, 145),
//         'text': 'أسئلة شائعة',
//         'page': const FAQPage(), // الصفحة الخاصة بالأسئلة الشائعة
//       },
//       {
//         'icon': Icons.phone,
//         'color': const Color.fromARGB(255, 28, 44, 144),
//         'text': 'اتصل بنا',
//         'page': const Callus(), // الصفحة الخاصة بالاتصال
//       },
//       {
//         'icon': FontAwesomeIcons.whatsapp,
//         'color': Colors.green,
//         'text': 'واتساب',
//         'page': const WhatsAppPage(), // الصفحة الخاصة بالواتساب
//       },
//       {
//         'icon': Icons.edit_outlined,
//         'color': Colors.green,
//         'text': 'اضف اقتراح',
//         'page': const AddSuggestionPage(), // الصفحة الخاصة بإضافة اقتراح
//       },
//       {
//         'icon': Icons.warning_amber_rounded,
//         'color': const Color.fromARGB(255, 144, 11, 6),
//         'text': 'إبلاغ عن مشكلة',
//         'page': const ReportIssuePage(), // الصفحة الخاصة بالإبلاغ عن مشكلة
//       },
//     ];

//     return buttonsData.map((button) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 25.0),
//         child: Center(
//           child: _buildButton(
//             button['icon'],
//             button['color'],
//             button['text'],
//             button['page'], // تمرير الصفحة هنا
//             context,
//           ),
//         ),
//       );
//     }).toList();
//   }

//   Widget _buildLogo() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 70, left: 30),
//       child: Center(
//         child: Image.asset(
//           'assets/images/app1.jpeg',
//           height: 50,
//           width: 100,
//         ),
//       ),
//     );
//   }

//   Widget _buildButton(dynamic icon, Color iconColor, String text, Widget page,
//       BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => page), // الانتقال إلى الصفحة
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           shadowColor: Colors.black.withOpacity(0.15),
//           elevation: 4,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Icon(icon, color: iconColor),
//               ),
//               Text(text, style: const TextStyle(color: Colors.black)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // صفحات وهمية لتوضيح الانتقال
// class SupportTeamPage extends StatelessWidget {
//   const SupportTeamPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('فريق الدعم')),
//       body: const Center(child: Text('صفحة فريق الدعم')),
//     );
//   }
// }

// class FAQPage extends StatelessWidget {
//   const FAQPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('الأسئلة الشائعة')),
//       body: const Center(child: Text('صفحة الأسئلة الشائعة')),
//     );
//   }
// }

// class WhatsAppPage extends StatelessWidget {
//   const WhatsAppPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('واتساب')),
//       body: const Center(child: Text('صفحة واتساب')),
//     );
//   }
// }

// class AddSuggestionPage extends StatelessWidget {
//   const AddSuggestionPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('اضف اقتراح')),
//       body: const Center(child: Text('صفحة إضافة اقتراح')),
//     );
//   }
// }

// class ReportIssuePage extends StatelessWidget {
//   const ReportIssuePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('إبلاغ عن مشكلة')),
//       body: const Center(child: Text('صفحة الإبلاغ عن مشكلة')),
//     );
//   }
// }
