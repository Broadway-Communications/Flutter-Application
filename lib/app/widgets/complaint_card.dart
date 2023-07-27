import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  final String complaintNumber;
  final String issue;
  final String description;
  final String dateAdded;
  final String status;
  final int? rating;

  const ComplaintCard(
      {Key? key,
      required this.complaintNumber,
      required this.issue,
      required this.description,
      required this.dateAdded,
      required this.status,
      this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '#$complaintNumber',
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Color(0xFF3A5396),
              ),
            ),
            Text(
              issue,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFF021B15).withOpacity(0.74),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dateAdded,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Date Added',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFF021B15).withOpacity(0.56),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF425550),
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: getStatusColor(status),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (status == 'Closed')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ...List.generate(
                        rating!,
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xFF1C1B1F),
                        ),
                      ),
                      ...List.generate(
                        5 - rating!,
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$rating/5',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF425550),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Status colors
Color getStatusColor(String status) {
  switch (status) {
    case 'Closed':
      return const Color(0xFF83E360);
    case 'Open':
      return Colors.red;
    case 'In Progress':
      return Colors.blueAccent;
    default:
      return Colors.black;
  }
}
