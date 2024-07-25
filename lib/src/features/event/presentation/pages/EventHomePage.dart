import 'package:count_down/src/features/event/presentation/widget/event_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventHomeView extends StatelessWidget {
  const EventHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: _action(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Text(
                "Your Events",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                // physics: ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const EventContainer();
                      },
                    ),
                    SizedBox(height: 20.h),
                    const _AddButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _action() {
  return [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.archive,
        color: Colors.blue,
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.settings,
        color: Colors.blue,
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 250,
      height: 35,
      child: TextField(
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 14.spMin),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search...",
          filled: true,
          fillColor: Colors.grey.shade700,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        ),
      ),
    )
  ];
}

class _AddButton extends StatelessWidget {
  const _AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250.w,
          height: 55.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blue),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Add Event",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.spMin),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
