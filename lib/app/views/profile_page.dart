import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 17.0),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  listItems(Icons.email_outlined, 'Update Email'),
                  listItems(Icons.phone_android, 'Update Mobile'),
                  listItems(Icons.devices, 'Update Mac'),
                  listItems(Icons.edit_location_outlined, 'Update Address'),
                  listItems(Icons.lock_outline, 'Change Password'),
                  listItems(Icons.location_on_outlined, 'My Geo Location'),
                  listItems(
                      Icons.notifications_active_outlined, 'Push Notification'),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget listItems(IconData icon, String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 43,
              backgroundColor: const Color(0xFFB4BBEA),
              child: Icon(
                icon,
                color: Colors.black,
                size: 27,
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
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 11,
          endIndent: 11,
        )
      ],
    );
  }
}
