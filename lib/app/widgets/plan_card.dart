// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String speed;
  final String validity;
  final String bill;
  final bool isExpired;

  const PlanCard({
    Key? key,
    required this.title,
    required this.speed,
    required this.validity,
    required this.bill,
    this.isExpired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF021B15),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: Text(
                      'Paid',
                      style: TextStyle(
                        color: const Color(0xFF2CA800),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    speed,
                    style: TextStyle(
                      color: const Color(0xFF3A5396),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  const DownloadButton()
                ],
              ),
              Text(
                validity,
                style: TextStyle(
                  color: const Color(0xFF021B15),
                  fontWeight: FontWeight.normal,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isExpired
                          ? Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Expired',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFC51111),
                                  fontSize: 20.sp,
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expiring in',
                                  style: TextStyle(
                                    color: const Color(0xFF021B15),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  '24d 12h',
                                  style: TextStyle(
                                    color: const Color(0xFF3A5396),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Bill Amount',
                        style: TextStyle(
                          color: const Color(0xFF021B15),
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.currency_rupee,
                                  color: const Color(0xFF3A5396), size: 20.sp),
                            ),
                            TextSpan(
                              text: bill,
                              style: TextStyle(
                                color: const Color(0xFF3A5396),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isDownloaded = false;

  void _toggleDownload() {
    setState(() {
      _isDownloaded = !_isDownloaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isDownloaded ? Icons.download_done_outlined : Icons.download_for_offline_outlined,
        color: const Color(0xFF3A5396),
        size: _isDownloaded ? 24.0 : 27.0,
      ),
      onPressed: _toggleDownload,
    );
  }
}