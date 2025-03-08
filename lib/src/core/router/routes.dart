import 'package:count_down/src/features/event/presentation/pages/EventHomePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const MaterialPage(child: SizedBox.shrink()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (state, context) =>
          const MaterialPage(child: EventHomeView()),
    ),
  ],
);
