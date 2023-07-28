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
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.79,
        height: size.height,
        child: Drawer(
          child: Container(
            width: size.width * 0.43,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF132948), Color(0xFF3D579D)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                listItems(Icons.donut_small_rounded, 'Session History'),
                listItems(Icons.error_outline, 'Complaint History'),
                listItems(Icons.currency_exchange_outlined, 'Invoice History'),
                listItems(Icons.sell_outlined, 'Promo Offers'),
                listItems(Icons.language_outlined, 'Open in Browser'),
                const MyContainer(), // Add the MyContainer widget here
              ],
            ),
          ),
        ));
  }
}

Widget listItems(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 20),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 34,
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
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(top: 44),
      child: Center(
        child: SizedBox(
          width: 120,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 2, color: Colors.white))),
            child: Text(
              "Logout",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
