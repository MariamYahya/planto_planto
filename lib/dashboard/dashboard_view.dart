import 'package:flutter/material.dart';
import 'package:planto_planto/modules/camera/camera_screen.dart';
import 'package:planto_planto/modules/home/home_screen.dart';
import 'package:planto_planto/modules/robot_contol/robot_contol.dart';
import 'package:planto_planto/modules/sensors/sensors_screen.dart';

class DashboardView extends StatefulWidget {
  static const String routeName = "dashboard";

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;

  List<Widget> screens =[
    HomeScreen(),
    CameraScreen(),
    SensorsScreen(),
    RobotControlView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
         setState(() {
           selectedIndex = index;
         });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensors_outlined),
            label: "Sensors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera_rounded),
            label: "Control",
          ),
        ],
      ),
    );
  }
}
