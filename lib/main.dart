import 'package:count_down/src/core/router/routes.dart';
import 'package:count_down/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/features/event/data/services/event_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize event storage
  final eventStorage = EventStorageService();
  await eventStorage.init();

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
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
