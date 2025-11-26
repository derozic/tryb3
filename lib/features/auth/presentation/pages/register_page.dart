import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/components/tux_input.dart';
import '../../../../tux/tokens/spacing.dart';
import '../../../../tux/tokens/colors.dart';
import '../../providers/auth_providers.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the terms and conditions'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(authNotifierProvider.notifier).registerWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text,
        _nameController.text.trim(),
      );
      
      if (mounted) {
        // Registration successful - navigate directly to home/dashboard
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Welcome to TRYB3!'),
            backgroundColor: Colors.green,
          ),
        );
        
        // Navigate to home - user is now authenticated
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Back button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => context.go('/login'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                
                const SizedBox(height: TuxSpacing.lg),
                
                // Title
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: TuxSpacing.xs),
                Text(
                  'Join ${AppConstants.appName} today',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: TuxColors.textSecondary,
                  ),
                ),
                
                const SizedBox(height: TuxSpacing.xl),
                
                // Full Name
                TuxInput(
                  controller: _nameController,
                  label: 'Full Name',
                  placeholder: 'Enter your full name',
                  enabled: !_isLoading,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: TuxSpacing.md),
                
                // Username
                TuxInput(
                  controller: _usernameController,
                  label: 'Username',
                  placeholder: 'Choose a username',
                  helperText: 'This will be your unique @username',
                  enabled: !_isLoading,
                  prefix: const Text('@', style: TextStyle(color: TuxColors.textSecondary)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                      return 'Username can only contain letters, numbers, and underscores';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: TuxSpacing.md),
                
                // Email
                TuxInput(
                  controller: _emailController,
                  label: 'Email',
                  placeholder: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  enabled: !_isLoading,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: TuxSpacing.md),
                
                // Password
                TuxInput(
                  controller: _passwordController,
                  label: 'Password',
                  placeholder: 'Create a password',
                  obscureText: _obscurePassword,
                  enabled: !_isLoading,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: TuxColors.textTertiary,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: TuxSpacing.md),
                
                // Confirm Password
                TuxInput(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  placeholder: 'Re-enter your password',
                  obscureText: _obscureConfirmPassword,
                  enabled: !_isLoading,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: TuxColors.textTertiary,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: TuxSpacing.lg),
                
                // Terms and Conditions
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: _isLoading ? null : (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _isLoading ? null : () {
                          setState(() {
                            _acceptedTerms = !_acceptedTerms;
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(text: 'I agree to the '),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                  color: TuxColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: TuxSpacing.lg),
                
                // Admin Approval Notice
                Container(
                  padding: const EdgeInsets.all(TuxSpacing.md),
                  decoration: BoxDecoration(
                    color: TuxColors.info.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: TuxColors.info.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: TuxColors.info, size: 20),
                      const SizedBox(width: TuxSpacing.sm),
                      Expanded(
                        child: Text(
                          'Note: New accounts require admin approval before access',
                          style: TextStyle(fontSize: 12, color: TuxColors.info),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: TuxSpacing.lg),
                
                // Register Button
                TuxButton(
                  label: 'Create Account',
                  onPressed: _isLoading ? null : _handleRegister,
                  isLoading: _isLoading,
                  isFullWidth: true,
                  size: TuxButtonSize.large,
                ),
                
                const SizedBox(height: TuxSpacing.lg),
                
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}