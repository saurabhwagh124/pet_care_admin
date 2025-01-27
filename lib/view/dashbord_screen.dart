import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, dynamic>> dashboardItems = [
    {'icon': Icons.pets, 'title': 'Pet Management', 'route': '/pet'},
    {'icon': Icons.pets_rounded, 'title': 'Grooming', 'route': '/grooming'},
    {
      'icon': Icons.calendar_today,
      'title': 'Appointments',
      'route': '/appointments'
    },
    {'icon': Icons.person, 'title': 'User Management', 'route': '/parks'},
    {'icon': Icons.video_collection, 'title': 'Services', 'route': '/services'},
    {'icon': Icons.people, 'title': 'Boarding', 'route': '/boarding'},
    {
      'icon': Icons.local_hospital,
      'title': 'Veterinary',
      'route': '/veterinary'
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Store management',
      'route': '/reports'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              "assets/bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(item['route']),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item['icon'],
                              size: 48.0,
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(height: 8.0.h),
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
