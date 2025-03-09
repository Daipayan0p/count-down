import 'package:count_down/src/core/const/keys.dart';
import 'package:count_down/src/core/router/routes.dart';
import 'package:count_down/src/core/theme/theme.dart';
import 'package:count_down/src/features/event/domain/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(EventAdapter());
  eventBox = await Hive.openBox<Event>("EventBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: const Size(834, 1194),
      child: MaterialApp.router(
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
