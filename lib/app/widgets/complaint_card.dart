import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ComplaintCard extends StatefulWidget {
  final String complaintNumber;
  final String issue;
  final String description;
  final String dateAdded;
  final int index;

  const ComplaintCard({
    Key? key,
    required this.complaintNumber,
    required this.issue,
    required this.description,
    required this.dateAdded,
    required this.index,
  }) : super(key: key);

  @override
  State<ComplaintCard> createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  List<Map<String, Color>> status = [
    {"Closed": Color(0xFF83E360)},
    {"Open": Colors.red},
    {"In Progress": Colors.blueAccent},
  ];
  double rating = -1;
  var rng = Random();

  @override
  void initState() {
    rating = -1;
    status.shuffle();
    super.initState();
  }

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
              '#${widget.complaintNumber}',
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Color(0xFF3A5396),
              ),
            ),
            Text(
              widget.issue,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              widget.description,
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
                      widget.dateAdded,
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
                      status[widget.index].keys.first,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: status[widget.index].values.first,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            status[widget.index].keys.first == 'Open' ||
                    status[widget.index].keys.first == 'In Progress'
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: rating == -1
                          ? rateButton(context)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RatingBarIndicator(
                                    itemSize: 23,
                                    rating: rating,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.blue[900],
                                      );
                                    }),
                                rateButton(context)
                              ],
                            ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget rateButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0, backgroundColor: Colors.transparent),
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size;
          return dialogBox(size);
        },
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.17,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rating == -1
                ? const Padding(
                    padding: EdgeInsets.only(right: 7),
                    child: Icon(Icons.star_border_rounded),
                  )
                : const SizedBox.shrink(),
            Text(
              'Rate',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog dialogBox(Size size) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      titlePadding: const EdgeInsets.all(2),
      contentPadding: EdgeInsets.symmetric(horizontal: 83),
      title: Stack(
        children: [
          Positioned(
            top: 0.0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  rating = -1;
                  context.router.pop();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 24),
              child: const Text(
                'Rate Us!!',
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: size.height * 0.17,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RatingBar.builder(
                glow: false,
                itemPadding: const EdgeInsets.all(2),
                allowHalfRating: true,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.blue[900],
                  );
                },
                onRatingUpdate: (newRating) {
                  rating = newRating;
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    rating = rating;
                    context.router.pop();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return const Color(0xFF0F4C75);
                    },
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
