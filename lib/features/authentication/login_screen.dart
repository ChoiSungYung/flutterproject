import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/apple_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_buttons.dart';
import 'package:tiktok_clone/features/authentication/widgets/login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginFormScreen(),
    ));
  }

  void _onAppleTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AppleScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Log in to TikTok',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Gaps.v20,
              const Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
                child: AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.solidUser),
                  text: 'Use Email & password',
                  tap: _onEmailLoginTap,
                ),
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.facebook),
                text: 'Continue with facebook',
                tap: _onAppleTap,
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: 'Continue with Apple',
                tap: _onAppleTap,
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                text: 'Continue with Google',
                tap: _onAppleTap,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
