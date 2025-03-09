import 'package:count_down/src/core/const/keys.dart';
import 'package:count_down/src/features/event/domain/models/event_model.dart';
import 'package:count_down/src/features/event/presentation/widget/bottom_sheet.dart';
import 'package:count_down/src/features/event/presentation/widget/event_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class EventHomeView extends StatefulWidget {
  const EventHomeView({super.key});

  @override
  _EventHomeViewState createState() => _EventHomeViewState();
}

class _EventHomeViewState extends State<EventHomeView> {
  bool _isSearchVisible = false;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Delete past events before yesterday
    eventBox.values
        .cast<Event>()
        .where(
          (event) => event.dateTime.isBefore(
            DateTime.now().subtract(const Duration(days: 1)).copyWith(
                  hour: 0,
                  minute: 0,
                  second: 0,
                  millisecond: 0,
                  microsecond: 0,
                ),
          ),
        )
        .toList()
        .forEach((event) {
      eventBox.delete(event.id);
    });

    // Fetch and sort upcoming events
    final List<Event> sortedEvents = eventBox.values
        .cast<Event>()
        .where((event) => event.title
            .toLowerCase()
            .contains(_searchQuery.toLowerCase())) // Apply search filter
        .toList()
      ..sort((a, b) =>
          a.dateTime.compareTo(b.dateTime)); // Sort by nearest date first

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final Event? event = await showEventPicker(context);
          if (event != null) {
            setState(() {
              eventBox.put(event.id, event);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Event'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: theme.scaffoldBackgroundColor,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 42.w),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CountDown",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _isSearchVisible = !_isSearchVisible;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_isSearchVisible)
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: Container(
                    color: theme.scaffoldBackgroundColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _searchQuery =
                                value; // Trigger UI rebuild on text change
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search events...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(44.w, 16.h, 40.w, 0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Your Events",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(40.w, 16.h, 40.w, 100.h),
              sliver: sortedEvents.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: EventContainer(
                            onDismissed: () {
                              setState(() {
                                eventBox.delete(sortedEvents[index].id);
                              });
                            },
                            event: sortedEvents[index],
                          ),
                        ),
                        childCount: sortedEvents.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 80.h),
                          child: Text(
                            "No events available",
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: theme.colorScheme.inverseSurface.withValues(alpha: 0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
