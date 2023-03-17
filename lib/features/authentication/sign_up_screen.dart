import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/apple_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_buttons.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  void _onAppleTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AppleScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const Scaffold(
            body: Center(
              child: Text('Plz rotate your phone.'),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    '틱톡 회원가입',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Gaps.v20,
                  Text(
                    '계정을 관리하고, 알림을 확인하고, 영상에 댓글을 남기세요!',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: isDarkMode(context)
                          ? Colors.grey.shade300
                          : Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.solidUser),
                      text: '이메일과 비밀번호로 회원가입',
                      tap: _onEmailTap,
                    ),
                    Gaps.v10,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      text: '페이스북 계정으로 회원가입',
                      tap: _onAppleTap,
                    ),
                    Gaps.v10,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: '애플 계정으로 회원가입',
                      tap: _onAppleTap,
                    ),
                    Gaps.v10,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      text: '구글 계정으로 회원가입',
                      tap: _onAppleTap,
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.solidUser),
                            text: '이메일 & 패스워드로 로그인하기',
                            tap: _onEmailTap,
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.facebook),
                            text: '페이스북 아이디로 회원가입',
                            tap: _onAppleTap,
                          ),
                        ),
                      ],
                    )
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
                  const Text(
                    '이미 계정이 있나요?',
                    style: TextStyle(),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      '로그인',
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
      },
    );
  }
}
