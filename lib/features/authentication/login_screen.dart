import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/apple_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_buttons.dart';
import 'package:tiktok_clone/features/authentication/widgets/login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ));
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
                '틱톡 로그인',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Gaps.v20,
              const Text(
                '계정을 관리하고, 알림을 확인하고, 영상에 댓글을 남기세요!',
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
                  text: '이메일과 비밀번호로 로그인',
                  tap: _onEmailLoginTap,
                ),
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.facebook),
                text: '페이스북 계정으로 로그인',
                tap: _onAppleTap,
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: '애플 계정으로 로그인',
                tap: _onAppleTap,
              ),
              Gaps.v10,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                text: '구글 계정으로 로그인',
                tap: _onAppleTap,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size32,
            bottom: Sizes.size64,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('아이디가 없으신가요?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  '회원가입',
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
