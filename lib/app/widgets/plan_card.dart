import 'package:flutter/material.dart';

class PlanCard extends StatefulWidget {
  const PlanCard({super.key});

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(255),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.45,
              child: RichText(
                text: TextSpan(
                  text: '12 Nov 2021 ',
                  style: theme.textTheme.titleLarge,
                  children: [
                    TextSpan(
                        text: '03:28 \nPM\n',
                        style: theme.textTheme.titleLarge),
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
            indent: 7,
            endIndent: 7,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: RichText(
                    text: TextSpan(
                        text: '10 Mbps\n',
                        style: theme.textTheme.titleLarge,
                        children: [
                          TextSpan(
                              text: '1 Month',
                              style: theme.textTheme.bodyMedium),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: [
                  Icon(
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
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
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
