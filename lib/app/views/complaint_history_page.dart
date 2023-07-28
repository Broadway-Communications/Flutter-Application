import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/annotations.dart';
import 'package:unicorn/app/widgets/complaint_card.dart';

final complaints = [
  {
    'complaintNumber': '519',
    'issue': 'INTERNET Issue',
    'description': 'Slow Speed',
    'dateAdded': '2021-12-08 17:59:22',
    'status': 'Open',
  },
  {
    'complaintNumber': '617',
    'issue': 'INTERNET ',
    'description': 'Slow Speed',
    'dateAdded': '2021-12-08 17:59:22',
    'status': 'Closed',
    'rating': 3,
  },
  {
    'complaintNumber': '23',
    'issue': 'Billing',
    'description': 'Refund Request',
    'dateAdded': '2021-12-08 17:59:22',
    'status': 'In Progress',
  },
  // // Add more complaints here to test scrollable for big screens...
];

@RoutePage()
class ComplaintHistoryPage extends StatelessWidget {
  const ComplaintHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),
            colors: [Color(0xff001422), Color(0xff3D579D)],
            stops: [0, 1],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: const Text(
                      'Complaint History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: complaints.isEmpty
                        ? const Center(
                            child: Text(
                              "Your complaints will be here",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: complaints.map((complaint) {
                                return ComplaintCard(
                                  complaintNumber:
                                      complaint['complaintNumber'] as String,
                                  issue: complaint['issue'] as String,
                                  description:
                                      complaint['description'] as String,
                                  dateAdded: complaint['dateAdded'] as String,
                                  status: complaint['status'] as String,
                                  rating: complaint['rating'] != null
                                      ? complaint['rating'] as int
                                      : null,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
