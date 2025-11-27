import 'package:flutter/material.dart';
import 'core/styles/app_theme.dart';
import 'features/onboarding/onboarding_page.dart';
import 'features/auth/login_page.dart';
import 'features/explore/explore_page.dart';

void main() {
  runApp(const PixelforceApp());
}

class PixelforceApp extends StatelessWidget {
  const PixelforceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixelforce Explore',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light, 
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (_) => const OnboardingPage(),
        '/login': (_) => const LoginPage(),
        '/explore': (_) => const ExplorePage(),
      },
    );
  }
}
