import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicorn/app/views/complaint_history_page.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    listItems(context, Icons.donut_small_rounded,
                        'Session History', const DummyWidget()),
                    listItems(
                      context,
                      Icons.error_outline,
                      'Complaint History',
                      const ComplaintHistoryPage(),
                    ),
                    listItems(context, Icons.currency_exchange_outlined,
                        'Invoice History', const DummyWidget()),
                    listItems(context, Icons.sell_outlined, 'Promo Offers',
                        const DummyWidget()),
                    listItems(context, Icons.language_outlined,
                        'Open in Browser', const DummyWidget()),
                    const MyContainer(
                      onPressed: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: Text(
                  "v1.0.0-alpha+3",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 162, 208, 230),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

listItems(
    BuildContext context, IconData icon, String text, Widget destination) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 40, left: 10),
    child: Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Ink(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: destination.runtimeType != DummyWidget
              ? () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => destination))
              : null,
          child: ListTile(
            leading: Icon(
              icon,
              color: destination.runtimeType != DummyWidget
                  ? Colors.white
                  : Colors.grey,
              size: 24,
            ),
            contentPadding: const EdgeInsets.only(left: 24),
            horizontalTitleGap: 22,
            title: Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 17.sp,
                fontWeight: destination.runtimeType != DummyWidget
                    ? FontWeight.w500
                    : FontWeight.w300,
                color: destination.runtimeType != DummyWidget
                    ? Colors.white
                    : Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyContainer extends StatelessWidget {
  final VoidCallback? onPressed;

  const MyContainer({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0).copyWith(top: 44),
      child: Center(
        child: SizedBox(
          width: 130,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.transparent;
                  }
                  return Colors.transparent;
                },
              ),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                (Set<MaterialState> states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      width: 2,
                      color: states.contains(MaterialState.disabled)
                          ? Colors.grey
                          : Colors.white,
                    ),
                  );
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }
                  return Colors.white;
                },
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DummyWidget extends StatelessWidget {
  const DummyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
