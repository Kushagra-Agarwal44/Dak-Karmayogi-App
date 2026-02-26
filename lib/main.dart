import 'package:dak_karmayogi_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: DakKarmayogiApp(),
    ),
  );
}

class DakKarmayogiApp extends StatelessWidget {
  const DakKarmayogiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: const Scaffold(
        body: Center(
          child:LoginScreen(),
        ),
      ),
    );
  }
}
