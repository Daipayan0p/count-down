import 'package:count_down/src/features/event/domain/models/event_model.dart';
import 'package:count_down/src/features/event/presentation/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int daysUntil(DateTime futureDate) {
  DateTime today = DateTime.now();
  DateTime start =
      DateTime(today.year, today.month, today.day); // Normalize today
  DateTime end = DateTime(futureDate.year, futureDate.month,
      futureDate.day); // Normalize future date

  return end.difference(start).inDays;
}

class EventContainer extends StatelessWidget {
  const EventContainer(
      {super.key, required this.event, required this.onDismissed});

  final Function() onDismissed;
  final Event event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        onDismissed();
        // Handle the delete action here
        // For example, you can call a function to remove the item from a list
      },
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade500,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            const Spacer(),
            const Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 8.w),
            const Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Row(
            children: [
              // Days Counter
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${daysUntil(event.dateTime)}",
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "days",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 24.w),

              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      formatDate(event.dateTime),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    )
                  ],
                ),
              ),

              // Actions
              // IconButton(
              //   onPressed: () {
              //     // Handle the edit action here
              //     // For example, navigate to an edit screen or open a dialog
              //   },
              //   icon: Icon(
              //     Icons.edit,
              //     color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
