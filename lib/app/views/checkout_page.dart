// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

enum PaymentMethod { paytm, payu, wallet }

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  PaymentMethod? _selectedMethod = PaymentMethod.wallet;

  Card _buildListTile({
    required PaymentMethod method,
    required String assetName,
    required double iconWidth,
    bool? wallet,
    String? money,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _selectedMethod == method
              ? const Color(0xFF3A5396)
              : const Color(
                  0xFFCDCBCB), // Change this color according to your need
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Transform.scale(
          scale: 1.3,
          child: Radio(
            activeColor: const Color(0xFF3A5396),
            value: method,
            groupValue: _selectedMethod,
            onChanged: (PaymentMethod? newMethod) {
              setState(() {
                _selectedMethod = newMethod;
              });
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              'assets/icons/$assetName.svg',
              width: iconWidth,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        trailing: wallet == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.currency_rupee,
                              color: Colors.black, size: 15.sp),
                        ),
                        TextSpan(
                          text: money,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            : null,
        onTap: () {
          setState(() {
            _selectedMethod = method;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
            bottomSheet: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Symbols.send_money,
                  fill: 1,
                  weight: 700,
                  grade: 0.25,
                  opticalSize: 48,
                  color: Colors.white,
                ),
                label: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Confirm & Procced',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                onPressed: null,
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all<Color>(
                //       const Color(0xFF0F4C75)),
                // ),
              ),
            ),
            body: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: ListView(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                                'assets/images/checkout-background.svg'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.95,
                            child: Card(
                              color: const Color(0xFFEFF3F9),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Payment Methods",
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Choose your desired payment method",
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF6E6E6E),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildListTile(
                                      method: PaymentMethod.paytm,
                                      assetName: 'paytm-icon',
                                      iconWidth: 80,
                                      wallet: true,
                                      money: "500",
                                    ),
                                    _buildListTile(
                                      method: PaymentMethod.payu,
                                      assetName: 'payu-icon',
                                      iconWidth: 80,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Wallet",
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6E6E6E),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    _buildListTile(
                                      method: PaymentMethod.wallet,
                                      assetName: 'wallet-icon',
                                      iconWidth: 80,
                                      wallet: true,
                                      money: "2,000",
                                    ),
                                  ],
                                ),
                    
                              ),
                            ),
                          ),
                          const SizedBox(height: 100)
                        ],
                        
                      ),
                    ),
                  ),
                ),
                
              ],
              
            ),
          ),
        ));
  }
}
