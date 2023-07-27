import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3.0,
      color: const Color.fromARGB(255, 252, 248, 255),
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Blazing Speed',
                  style: TextStyle(
                    color: const Color(0xFF021B15),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                    height: 0.8.h,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  'Paid',
                  style: TextStyle(
                    color: const Color(0xFF2CA800),
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.14286,
                    letterSpacing: 0.5,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              '10 Mbps Unlimited',
              style: TextStyle(
                color: const Color(0xFF3A5396),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.5,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '1 Month',
              style: TextStyle(
                color: const Color(0xFF021B15),
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                height: 1.23077.h,
                letterSpacing: 0.5,
                fontSize: 13.sp,
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expiring in',
                  style: TextStyle(
                    color: const Color(0xFF021B15),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  'Bill Amount',
                  style: TextStyle(
                    color: const Color(0xFF021B15),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24d 12h',
                  style: TextStyle(
                    color: const Color(0xFF3A5396),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  '₹483',
                  style: TextStyle(
                    color: const Color(0xFF3A5396),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
