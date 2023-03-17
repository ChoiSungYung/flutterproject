import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widget/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widget/user_account.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text(
                  '니꼬',
                ),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Gaps.v20,
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/ogw/AAEL6sinZ7lVJeR56zlp5YFEhLMJD4rUst7fet-cSMKolg=s32-c-mo"),
                      child: Text("니꼬"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "@니꼬",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserAccount(
                            count: '97',
                            title: 'Following',
                          ),
                          VerticalDivider(
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          const UserAccount(
                            count: '10.5M',
                            title: 'Followers',
                          ),
                          VerticalDivider(
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          const UserAccount(
                            count: '149.3M',
                            title: 'Likes',
                          ),
                        ],
                      ),
                    ),
                    Gaps.v10,
                    FractionallySizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size80,
                              vertical: Sizes.size18,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border.all(
                                width: 1,
                                color: Colors.red.shade500,
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h10,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size14,
                              vertical: Sizes.size14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.black87,
                            ),
                          ),
                          Gaps.h10,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size14,
                              vertical: Sizes.size14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.caretDown,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Text(
                      "All highlighted and where to watch live matches on FIFA+",
                      textAlign: TextAlign.center,
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "bookscreen.co.kr",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/bookvideo.png",
                              image:
                                  "https://images.unsplash.com/photo-1566895291281-ea63efd4bdbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8OSUzQTE2fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1480&q=80",
                            ),
                          ),
                          Positioned(
                            top: Sizes.size10,
                            left: Sizes.size10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size5,
                                horizontal: Sizes.size10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size5,
                                ),
                              ),
                              child: const Text(
                                'Pinned',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: Sizes.size10,
                            bottom: Sizes.size10,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.play,
                                  color: Colors.white,
                                ),
                                Gaps.h14,
                                Text(
                                  '4.1M',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text('Page two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
