import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(20),
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
            Flexible(
                child: Container(
                  width: widget.size.width * 0.14,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(widget.icon,color: const Color.fromARGB(255, 5, 62, 112), size: 34),
                  ),
                ),
              ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 7, 110, 158),
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
