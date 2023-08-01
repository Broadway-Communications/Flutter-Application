import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicorn/app/router/app_router.dart';

class PlanStatusCard extends StatefulWidget {
  const PlanStatusCard({super.key});
  @override
  State<PlanStatusCard> createState() => _PlanStatusCardState();
}

class _PlanStatusCardState extends State<PlanStatusCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white.withOpacity(0.89),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 190, 190, 190),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, bottom: 10),
            child: SizedBox(
              width: size.width * 0.55,
              child: RichText(
                maxLines: 3,
                text: TextSpan(
                  text: '12 Nov 2021 03:28\n',
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                  children: [
                    const WidgetSpan(
                        child: SizedBox(
                      height: 25,
                    )),
                    TextSpan(
                        text: 'PM\n',
                        style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5)),
                    const WidgetSpan(
                        child: SizedBox(
                      height: 23,
                    )),
                    TextSpan(
                      text: 'Expiry Date',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 196, 190, 211),
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26.0, top: 12),
                child: SizedBox(
                  child: RichText(
                    text: TextSpan(
                        text: '10 Mbps\n',
                        style: theme.textTheme.titleLarge,
                        children: [
                          const WidgetSpan(
                              child: SizedBox(
                            height: 25,
                          )),
                          TextSpan(
                              text: '1 Month',
                              style: theme.textTheme.bodyMedium),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 26, right: 26, bottom: 8, top: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.sim_card,
                        color: Color(0xFF3B5599),
                        size: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child:
                            Text('Prepaid', style: theme.textTheme.bodyLarge),
                      )
                    ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, left: 17, bottom: 8),
            child: ElevatedButton(
              onPressed: () {
                context.pushRoute(const CheckoutRoute());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 88, 82),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: const Text(
                "Renew",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
