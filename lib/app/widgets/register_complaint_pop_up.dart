import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicorn/app/router/app_router.dart';

class RegisterComplaintPopUp extends StatefulWidget {
  const RegisterComplaintPopUp({Key? key}) : super(key: key);

  @override
  RegisterComplaintPopUpState createState() => RegisterComplaintPopUpState();
}

class RegisterComplaintPopUpState extends State<RegisterComplaintPopUp> {
  String? _mainType;
  String? _subType;
  String? _description = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 13.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      contentPadding: const EdgeInsets.all(12.0),
      titlePadding: const EdgeInsets.all(0),
      title: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.router.pop(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Register Complaint',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListBody(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complaint MainType',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Theme.of(context).colorScheme.surfaceVariant,
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF1F3660)),
                    ),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Complaint MainType',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        width: size.width * 0.81,
                      ),
                      value: _mainType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _mainType = newValue;
                        });
                      },
                      items: <String>['Internet Issue', 'Billing', 'Others']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complaint SubType',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        colorScheme: ColorScheme.fromSeed(
                            seedColor: const Color(0xFF1F3660))),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: const Text('Select Complaint SubType'),
                      value: _subType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _subType = newValue;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: size.width * 0.81,
                      ),
                      items: <String>[
                        'Incorrect charges',
                        'Payment issues',
                        'Refund request',
                        'Unrecognized transactions'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19.sp),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: TextField(
                    controller: controller,
                    maxLength: 2000,
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Enter your complaint details',
                      counterText: '${_description!.length}/2000',
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey;
                              } else {
                                return const Color(0xFF0F4C75);
                              }
                            },
                          ),
                        ),
                        child: SizedBox(
                          width: size.width * 0.25,
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.router.push(const ComplaintHistoryRoute()),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey;
                              }
                              return const Color(0xFF0F4C75);
                            },
                          ),
                        ),
                        child: Text(
                          'View History',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
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
