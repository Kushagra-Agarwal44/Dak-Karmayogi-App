import 'package:dak_karmayogi_app/core/constants/app_assets.dart';
import 'package:dak_karmayogi_app/core/theme/app_colors.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedMode = "ONSITE";

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Logo
                  SvgPicture.asset(AppAssets.logo, height: 110),

                  const SizedBox(height: 40),

                  // Username
                  TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),

                      labelText: "Employee ID / Username",
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter ID" : null,
                  ),

                  const SizedBox(height: 16),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),

                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Enter password"
                        : null,
                  ),

                  const SizedBox(height: 16),

                  //RADIO BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: "ONLINE",
                            groupValue: _selectedMode,
                            onChanged: (value) {
                              setState(() {
                                _selectedMode = value!;
                              });
                            },
                          ),
                          const Text("Online"),
                        ],
                      ),

                      Row(
                        children: [
                          Radio<String>(
                            value: "ONSITE",
                            groupValue: _selectedMode,
                            onChanged: (value) {
                              setState(() {
                                _selectedMode = value!;
                              });
                            },
                          ),
                          const Text("Onsite"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: authState.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .login(
                                      _idController.text.trim(),
                                      _passwordController.text.trim(),
                                      _selectedMode,
                                    );
                              }
                            },
                      child: authState.isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => context.go('/forgot-password'),
                        child: const Text("Forgot Password?"),
                      ),
                      TextButton(
                        onPressed: () => context.go('/unlock-account'),
                        child: const Text("Unlock Account"),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/signup'),
                    child: const Text("New User? Sign Up"),
                  ),

                  const SizedBox(height: 40),

                  Text(
                    "Made with ❤️ by PTC Vadodara for DoP",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
