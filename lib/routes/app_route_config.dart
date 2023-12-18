import 'package:dhwani/views/dhwani_main/dhwani/dhwani_example/dhwani_mock_screen.dart';
import 'package:dhwani/views/home/home_view.dart';
import 'package:dhwani/views/mock/mock_view.dart';
import 'package:dhwani/views/onboarding/onboarding_view.dart';
import 'package:dhwani/views/profile/profile_view.dart';
import 'package:dhwani/views/routes_view/routeview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/auth/login_view.dart';
import '../views/dhwani_main/dhwani_screen.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const Routes(),
  ),
  GoRoute(
    name: 'Home Screen',
    path: '/homescreen',
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    name: 'Dhwani Screen',
    path: '/dhwaniscreen',
    builder: (context, state) => const DhwaniScreen(),
  ),
  GoRoute(
    name: 'Mock Test',
    path: '/mocktest',
    builder: (context, state) => const MockView(),
  ),
  GoRoute(
    name: 'Profile',
    path: '/profile',
    builder: (context, state) => const ProfileView(),
  ),
  GoRoute(
    name: 'Login',
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    name: 'Onboarding',
    path: '/onboarding',
    builder: (context, state) => const OnboardingScreen(),
  ),
]);
