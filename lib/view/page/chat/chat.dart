/* 채팅 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/view/widget/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ChatPresenter>(
      builder: (controller) {
        List<Widget> bubble(int index) => [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: controller.isMyChat(index)
                  ? colorScheme.tertiaryContainer
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: controller.isFirstChat(index) && !controller.isMyChat(index)
                    ? Radius.zero
                    : const Radius.circular(8.0),
                topRight: controller.isFirstChat(index) && controller.isMyChat(index)
                    ? Radius.zero
                    : const Radius.circular(8.0),
                bottomLeft: const Radius.circular(8.0),
                bottomRight: const Radius.circular(8.0),
              ),
            ),
            child: Text(controller.chats[index].text!),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FWText(controller.chats[index].timeString!,
              style: textTheme.labelSmall!,
              color: FWTheme.grey,
            ),
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.currentCrew!.title!),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: ChatPresenter.scrollCont,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          for (int i = 0; i < controller.chats.length; i++)
                            Column(
                              children: [
                                if (controller.isFirstChat(i) && !controller.isMyChat(i))
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Material(
                                        borderRadius: BorderRadius.circular(100.0),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 40.0, minHeight: 40.0,
                                          ),
                                          child: InkWell(
                                            onTap: () {},
                                            borderRadius: BorderRadius.circular(100.0),
                                            child: SizedBox(
                                              width: 40.0, height: 40.0,
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Image.network(
                                                  controller.getImageUrl(controller.chats[i].uid!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(controller.getNickname(controller.chats[i].uid!)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(60.0, 0.0, 20.0, 5.0),
                                  child: Row(
                                    mainAxisAlignment: controller.isMyChat(i)
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: controller.isMyChat(i)
                                        ? bubble(i).reversed.toList() : bubble(i),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                height: 60.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        height: 30.0,
                        child: TextFormField(
                          controller: ChatPresenter.textCont,
                          onFieldSubmitted: controller.chatSubmitted,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: controller.chatSubmitted,
                      child: const Text('전송'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
