import 'package:flutter/material.dart';
import 'package:ppppppp/view/screen/appointments/tabs/actives_tab.dart';
import 'package:ppppppp/view/screen/appointments/tabs/previews_tab.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مواعيدي'),
          centerTitle: true,
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.3),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorWeight: 2,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                labelColor: Colors.blue[800],
                unselectedLabelColor: Colors.grey[600],
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Cairo',
                ),
                tabs: const [
                  Tab(text: 'المواعيد الحالية'),
                  Tab(text: 'المواعيد السابقة'),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            children: const [
              ActivesTab(),
              PreviewsTab(),
            ],
          ),
        ),
      ),
    );
  }
}