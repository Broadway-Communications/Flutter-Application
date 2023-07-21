import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 3.0,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(20),
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
                    color: Color(0xFF021B15),
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Paid',
                  style: TextStyle(
                    color: Color(0xFF2CA800),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              '10 Mbps Unlimited',
              style: TextStyle(
                color: Color(0xFF3A5396),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '1 Month',
              style: TextStyle(
                color: Color(0xFF021B15),
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expiring in',
                  style: TextStyle(
                    color: Color(0xFF021B15),
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'Bill Amount',
                  style: TextStyle(
                    color: Color(0xFF021B15),
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24d 12h',
                  style: TextStyle(
                    color: Color(0xFF3A5396),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '₹483',
                  style: TextStyle(
                    color: Color(0xFF3A5396),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
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
