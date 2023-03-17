import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

//화면 고정 설정
void main() async {
  //폰트 로딩을 위한 FontLoader 객체 생성
  final FontLoader fontLoader = FontLoader('NanumGothic');

  //폰트를 로딩하고, 로딩이 완료되면 runApp 함수를 실행
  fontLoader.load().then((_) => runApp(const TikTokApp()));

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  //폰 상단 기능 색상 변경
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(const TikTokApp());
} // initiate MyApp as  StatelessWidget

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ko', 'KR'),
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'NanumGothic',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,

        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'NanumGothic',
          ),
          headlineLarge: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            fontFamily: 'NanumGothic',
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'NanumGothic',
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'NanumGothic',
          ),
          headlineLarge: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            fontFamily: 'NanumGothic',
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
      ),

      // home: const SignUpScreen(),
      home: const MainNavigationScreen(),
      //home: const SignUpScreen(),
    );
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width / 2,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.teal,
            child: Center(
              child: Text(
                "${size.width} / ${constraints.maxWidth}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 98,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
