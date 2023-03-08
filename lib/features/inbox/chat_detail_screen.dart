import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/ogw/AAEL6sinZ7lVJeR56zlp5YFEhLMJD4rUst7fet-cSMKolg=s32-c-mo'),
                child: Text(
                  '니꼬',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                height: Sizes.size16,
                width: Sizes.size16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      width: Sizes.size3,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size24),
                  ),
                ),
              ),
            ],
          ),
          title: const Text("xxxmnk"),
          subtitle: const Text("xxxmnk"),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: const [
            FaIcon(
              FontAwesomeIcons.flag,
              color: Colors.black,
              size: Sizes.size20,
            ),
            Gaps.h32,
            FaIcon(
              FontAwesomeIcons.ellipsis,
              color: Colors.black,
              size: Sizes.size20,
            ),
          ]),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              bottom: Sizes.size96 + Sizes.size10,
              right: Sizes.size16,
              left: Sizes.size16,
            ),
            itemBuilder: (context, index) {
              var isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(Sizes.size20),
                        topRight: const Radius.circular(Sizes.size20),
                        bottomLeft: isMine
                            ? const Radius.circular(Sizes.size20)
                            : const Radius.circular(Sizes.size1),
                        bottomRight: isMine
                            ? const Radius.circular(Sizes.size1)
                            : const Radius.circular(Sizes.size20),
                      ),
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size44,
                        child: TextField(
                          textInputAction: TextInputAction.newline,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: "Send a message...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                                vertical: Sizes.size10,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                  vertical: Sizes.size10,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.grey.shade900,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    Container(
                      alignment: Alignment.center,
                      width: Sizes.size48,
                      height: Sizes.size48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size24),
                        color: Colors.grey,
                      ),
                      child: const FaIcon(FontAwesomeIcons.solidPaperPlane,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
