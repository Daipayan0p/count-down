import 'package:count_down/src/features/event/domain/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

String formatDate(DateTime date) {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];


  return "${date.day} ${months[date.month - 1]} ${date.year}";
}
Future<Event?> showEventPicker(BuildContext context) async {
  TextEditingController titleController = TextEditingController();
  DateTime pickedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  dateController.text = formatDate(pickedDate);

  return await showModalBottomSheet<Event>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 300,
          padding: EdgeInsets.all(40.w),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(60.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                "Create Event",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              /// Event Title Input
              TextField(
                controller: titleController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: "Event Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.h),

              /// Date Picker Input
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "Select Date",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: pickedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (newDate != null) {
                    pickedDate = newDate;
                    dateController.text = formatDate(newDate);
                  }
                },
              ),
              SizedBox(height: 20.h),

              /// Confirm Button
              ElevatedButton(
                onPressed: () {
                  String eventTitle = titleController.text.trim();
                  if (eventTitle.isNotEmpty) {
                    final Event event = Event(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: eventTitle,
                      dateTime: pickedDate,
                    );
                    Navigator.pop(context, event); // ✅ Pass event back
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter an event title")),
                    );
                  }
                },
                child: const Center(child: Text("Confirm")),
              ),
            ],
          ),
        ),
      );
    },
  );
}

