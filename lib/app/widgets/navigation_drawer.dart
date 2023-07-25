import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
      
        decoration: const BoxDecoration(
          gradient: LinearGradient(
             colors: [Color(0xFF132948),
            Color(0xFF3D579D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(10, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]
        ),
        
      ),
    );
  }
}
