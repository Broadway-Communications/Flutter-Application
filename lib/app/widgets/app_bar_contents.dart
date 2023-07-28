import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget tab(String text) {
  return Tab(
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: Text(
        text,
        style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            height: 1.0,
            fontSize: 16.sp),
      ),
    ),
  );
}

Widget title(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(120)),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWxIwmVa8QmOHFoD75qJuEJh4O6dVc7-utA&usqp=CAU',
                  height: 48,
                  width: 48,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 38,
              )),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.93),
                    fontSize: 48.sp,
                    fontFamily: 'Lato',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    height: 0.3333,
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 8),
            child: Text(
              "Ankush Hegde",
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontFamily: 'Lato',
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.5,
                height: 0.8,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 2, top: 10),
            child: Text(
              "ankush@gmail.com",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.5,
                  height: 1.0667,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 10),
            child: Text(
              "123456789",
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'Lato',
              ),
            ),
          )
        ],
      ),
    ],
  );
}
