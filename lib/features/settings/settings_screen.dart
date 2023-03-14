import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('설정'),
        ),
        body: ListView(
          children: [
            Switch.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
            ),
            SwitchListTile.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text('알림 수신 동의'),
              subtitle: const Text('새로운 무료증정도서 업데이트 알림'),
            ),
            SwitchListTile.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text('주간책톡 수신 동의'),
              subtitle: const Text('월요일 아침, 도서요약본 6종을 카카오톡으로 발송해드립니다.'),
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text("주간레터 수신동의"),
              subtitle: const Text("매주 상품증정 독서퀴즈 문제와 지문을 이메일 발송해드립니다."),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                print(date);
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print(time);
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        appBarTheme: const AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                print(booking);
              },
              title: const Text(
                'What is your birthday?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              title: const Text("회원탈퇴(아이폰)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("정말로 탈퇴하시겠습니까?"),
                    content: const Text("탈퇴 이전에 적립된 북코캐시가 있는지 확인해주세요."),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("아니오"),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text("네"),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("회원탈퇴(안드로이드)"),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("정말로 탈퇴하시겠습니까?"),
                    content: const Text("탈퇴 이전에 적립된 북코캐시가 있는지 확인해주세요."),
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(
                          FontAwesomeIcons.o,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(
                          FontAwesomeIcons.x,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("회원탈퇴(iOS/Bottom)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text("정말로 탈퇴하시겠습니까?"),
                    message: const Text("pls don't goooooo."),
                    actions: [
                      CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Not log out")),
                      CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes pls.")),
                    ],
                  ),
                );
              },
            ),
            const AboutListTile(
              applicationVersion: '1.0',
              applicationLegalese: "무단 복제 금지",
            ),
          ],
        )
        // ListTile(
        //   onTap: () => showAboutDialog(
        //     context: context,
        //     applicationVersion: '1.0',
        //     applicationLegalese: 'All right reserved',
        //   ),
        //   title: const Text(
        //     'About',
        //     style: TextStyle(fontWeight: FontWeight.w600),
        //   ),
        //   subtitle: const Text('About This App......'),
        // ),
        // Column(
        //   children: const [
        //     CupertinoActivityIndicator(
        //       radius: 40,
        //       animating: false,
        //     ),
        //     CircularProgressIndicator(),
        //     CircularProgressIndicator.adaptive(),

        // ListWheelScrollView(
        //   itemExtent: 200,
        //   children: [
        //     for (var x in [1, 2, 1212, 1, 1, 1])
        //       FractionallySizedBox(
        //         widthFactor: 1,
        //         child: Container(
        //           alignment: Alignment.center,
        //           color: Colors.teal,
        //           child: const Text('Pick me'),
        //         ),
        //       ),
        //   ],
        // ),
        // ],
        );
  }
}
