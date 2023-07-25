import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: const Color.fromARGB(255, 255, 253, 253),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 195, 195, 195).withAlpha(255),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
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
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                  children: [
                    const WidgetSpan(
                        child: SizedBox(
                      height: 25,
                    )),
                    TextSpan(text: 'PM\n', style: theme.textTheme.titleLarge),
                    const WidgetSpan(
                        child: SizedBox(
                      height: 23,
                    )),
                    TextSpan(
                      text: 'Expiry Date',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 229, 227, 227),
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
                child: Column(children: [
                  const Icon(
                    Icons.sim_card,
                    color: Colors.blue,
                    size: 45,
                  ),
                  Text('Prepaid', style: theme.textTheme.bodyLarge)
                ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, left: 17, bottom: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "Renew",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    );
  }
}
