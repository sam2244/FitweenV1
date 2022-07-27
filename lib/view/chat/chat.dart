import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: GetBuilder<ChatPresenter>(
        builder: (controller) {
          return SingleChildScrollView(
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
                                    minWidth: 40.0,
                                    minHeight: 40.0,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.network(
                                          controller.chats[i].userImageUrl!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(controller.chats[i].userNickname!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60.0, 0.0, 20.0, 5.0),
                          child: Row(
                            mainAxisAlignment: controller.isMyChat(i)
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: controller.isMyChat(i)
                                      ? Theme.of(context).colorScheme.tertiaryContainer
                                      : Theme.of(context).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.only(
                                    topLeft: controller.isFirstChat(i) && !controller.isMyChat(i)
                                        ? Radius.zero
                                        : const Radius.circular(8.0),
                                    topRight: controller.isFirstChat(i) && controller.isMyChat(i)
                                        ? Radius.zero
                                        : const Radius.circular(8.0),
                                    bottomLeft: const Radius.circular(8.0),
                                    bottomRight: const Radius.circular(8.0),
                                  ),
                                ),
                                child: Text(controller.chats[i].text!),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 30.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: 30.0,
                          child: TextFormField(
                            controller: ChatPresenter.messageCont,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: controller.addChat,
                        child: Text('전송'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
