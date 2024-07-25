import 'package:count_down/src/features/auth/presentation/pages/login_page.dart';
import 'package:count_down/src/features/event/presentation/pages/EventHomePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
      const MaterialPage(child: SizedBox.shrink()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (state, context) => const MaterialPage(child: EventHomeView()),
    ),
  ],
);