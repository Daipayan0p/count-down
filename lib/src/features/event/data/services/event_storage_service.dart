import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/event_model.dart';

class EventStorageService {
  static const String _boxName = 'events';
  late Box<Event> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EventAdapter());
    _box = await Hive.openBox<Event>(_boxName);
  }

  Future<List<Event>> getAllEvents() async {
    return _box.values.toList();
  }

  Future<void> addEvent(
      String title, String description, DateTime dateTime) async {
    final event = Event(
      id: const Uuid().v4(),
      title: title,
      description: description,
      dateTime: dateTime,
    );
    await _box.put(event.id, event);
  }

  Future<void> updateEvent(Event event) async {
    await _box.put(event.id, event);
  }

  Future<void> deleteEvent(String id) async {
    await _box.delete(id);
  }

  Future<void> toggleEventCompletion(String id) async {
    final event = _box.get(id);
    if (event != null) {
      event.isCompleted = !event.isCompleted;
      await _box.put(id, event);
    }
  }

  Future<List<Event>> searchEvents(String query) async {
    return _box.values
        .where((event) =>
            event.title.toLowerCase().contains(query.toLowerCase()) ||
            event.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
