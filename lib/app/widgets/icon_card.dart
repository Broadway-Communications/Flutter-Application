import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconCard extends StatefulWidget {
  const IconCard(
      {super.key, required this.size, required this.text, required this.icon});

  final Size size;
  final String text;
  final IconData icon;

  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: size.width * 0.28,
        padding: const EdgeInsets.all(10).copyWith(bottom: 5),
        decoration: BoxDecoration(
          color: Color.alphaBlend(Colors.black.withOpacity(0.04), Colors.white),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 182, 180, 180),
              offset: Offset(0, 3),
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Flexible(
              child: Container(
                width: widget.size.width * 0.14,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(widget.icon,
                      color: const Color.fromARGB(255, 37, 68, 134), size: 34),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 37, 68, 134),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
