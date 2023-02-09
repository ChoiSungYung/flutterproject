import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObsecureText() {
    if (_obscureText == true) {
      _obscureText = false;
    } else {
      _obscureText = !_obscureText;
    }
    setState(() {});
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '회원가입',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v14,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v8,
              Gaps.v16,
              TextField(
                controller: _passwordController,
                onEditingComplete: () => _onSubmit(),
                autocorrect: false,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400, size: Sizes.size20),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObsecureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it Strong!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      Gaps.h5,
                      const Text(
                        "Your password must have: 8 to 20 characters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      Gaps.h5,
                      const Text(
                        "Letters, numbers, and special characters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              ),
            ],
          ),
        ));
  }
}
