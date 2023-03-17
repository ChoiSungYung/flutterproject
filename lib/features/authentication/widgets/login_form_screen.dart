import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = <String, String>{};
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '로그인',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: GestureDetector(
          onTap: _onSubmitTap,
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '이메일을 입력해주세요.',
                    ),
                    validator: (value) {
                      // return "i dont like your email";
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '비밀번호를 입력하세요.',
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  const FormButton(disabled: false, text: '로그인'),
                ],
              )),
        ),
      ),
    );
  }
}
