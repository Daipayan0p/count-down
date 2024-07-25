import 'package:count_down/src/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.eventBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          /// Front Part ///
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "12",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "days",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
              )
            ],
          ),

          const SizedBox(width: 30,),
          /// Second Part ///

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Event",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "04/08/24",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(),
              )
            ],
          ),
        ],
      ),
    );
  }
}