import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            colors: [Color(0xFF132948), Color(0xFF3D579D)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(10, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            listItems(Icons.donut_small_rounded, 'Session History'),
            listItems(Icons.error_outline, 'Complaint History'),
            listItems(Icons.currency_exchange_outlined, 'Invoice History'),
            listItems(Icons.sell_outlined, 'Promo Offers'),
            listItems(Icons.language_outlined, 'Open in Browser'),
            MyContainer(), // Add the MyContainer widget here
            
          ],
        ),
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}

Widget listItems(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 20),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 38,
      ),
      contentPadding: const EdgeInsets.only(left: 10),
      horizontalTitleGap: 22,
      title: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    ),
  );
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}



