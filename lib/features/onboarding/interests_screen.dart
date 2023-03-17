import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widget/interest_button.dart';

bool _showTitle = false;
const interests = [
  "일상",
  "코미디",
  "연예",
  "동물",
  "음식",
  "뷰티 & 스타일",
  "드라마",
  "학습",
  "재능",
  "스포츠",
  "자동차",
  "가족",
  "건강 & 피트니스",
  "DIY & 라이프 해킹",
  "미술 & 공예",
  "댄스",
  "야외활동",
  "기분 좋은",
  "가정 & 정원"
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TutorialScreen()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: const Text('관심사를 선택해주세요')),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: Sizes.size16,
              top: Sizes.size16,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  "관심사를 선택해주세요",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "내 취향에 더욱 맞는 영상을 추천받으세요.",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: Sizes.size40,
          top: Sizes.size16,
          left: Sizes.size24,
          right: Sizes.size24,
        ),
        child: CupertinoButton(
          borderRadius: BorderRadius.zero,
          color: Theme.of(context).primaryColor,
          onPressed: _onNextTap,
          child: Text(
            '다음',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
