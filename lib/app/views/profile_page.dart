import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: ResponsiveScaledBox(
            width: size.width * 1.17,
            child: Column(
              children: [
                ListView(
                  // itemExtent: 81.h,
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    listItems(Icons.email_outlined, 'Update Email'),
                    listItems(Icons.phone_android, 'Update Mobile'),
                    listItems(Icons.devices, 'Update Mac'),
                    listItems(Icons.edit_location_outlined, 'Update Address'),
                    listItems(Icons.lock_outline, 'Change Password'),
                    listItems(Icons.location_on_outlined, 'My Geo Location'),
                    listItems(Icons.notifications_active_outlined,
                        'Push Notification'),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget listItems(IconData icon, String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 43,
              backgroundColor: Color(0xFFB4BBEA),
              child: Icon(
                icon,
                color: Colors.black,
                size: 36,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 3),
            title: Text(
              text,
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000).withAlpha(230),
                  letterSpacing: 0.5),
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
