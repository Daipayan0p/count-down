import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
  bool isCompleted;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isCompleted = false,
  });
}
