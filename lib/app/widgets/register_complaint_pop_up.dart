import 'package:flutter/material.dart';

class RegisterComplaintPopUp extends StatefulWidget {
  const RegisterComplaintPopUp({Key? key}) : super(key: key);

  @override
  RegisterComplaintPopUpState createState() => RegisterComplaintPopUpState();
}

class RegisterComplaintPopUpState extends State<RegisterComplaintPopUp> {
  String? _mainType;
  String? _subType;
  String? _description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          titlePadding: const EdgeInsets.all(0),
          title: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Register Complaint'),
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListBody(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Complaint MainType'),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select Complaint MainType'),
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
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Complaint SubType'),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Select Complaint SubType'),
                        value: _subType,
                        onChanged: (String? newValue) {
                          setState(() {
                            _subType = newValue;
                          });
                        },
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
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Text('Description'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      onChanged: (value) {
                        _description = value;
                      },
                      minLines: 2,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'Enter your complaint details',
                        border: OutlineInputBorder(),
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
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF0F4C75)),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            child: const Text('View History'),
                            onPressed: () {},
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
      },
    );
  }
}
