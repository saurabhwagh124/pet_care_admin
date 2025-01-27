import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_care_admin/view/dashbord_screen.dart';
import 'package:pet_care_admin/view/groomingmanagementscreen.dart';

import 'controller/vet_controller.dart';
import 'view/appointmentscreen.dart';
import 'view/boardingmanagement.dart';

import 'view/petmanagementscreen.dart';
import 'view/reportscreen.dart';
import 'view/servicescreen.dart';
import 'view/usermanagement.dart';
import 'view/veterinaryscreen.dart';

void main() {
  Get.put(VetController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: false,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => DashboardScreen()),
          GetPage(name: '/pet', page: () => PetManagementScreen()),
          GetPage(name: '/grooming', page: () => GroomingManagementScreen()),
          GetPage(name: '/appointments', page: () => AppointmentsScreen()),
          GetPage(name: '/parks', page: () => UserManagementScreen()),
          GetPage(name: '/services', page: () => ServicesScreen()),
          GetPage(name: '/boarding', page: () => BoardingManagementScreen()),
          GetPage(name: '/veterinary', page: () => Veterinaryscreen()),
          GetPage(name: '/reports', page: () => ReportsScreen()),
        ],
      ),
    );
  }
}
