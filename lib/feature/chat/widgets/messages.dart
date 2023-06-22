import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/models/user_model.dart';
import '../../../common/utils/loading_page.dart';
import '../controller/chat_controller.dart';
import 'chat_bouble.dart';
import 'date_time_card.dart';
import 'encription_card.dart';

final pageStorageBucket = PageStorageBucket();

class Messages extends ConsumerWidget {
  Messages({
    super.key,
    required this.user,
    required this.chatController,
  });

  final UserModel user;
  final ScrollController chatController;

  final dateFormat = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: ref.watch(getAllOneToOneMessageProvider(user.uid)).whenOrNull(
                loading: () => const LoadingPage(),
                data: (messages) => PageStorage(
                  bucket: pageStorageBucket,
                  child: ListView.builder(
                    key: const PageStorageKey('chat_list_tile'),
                    controller: chatController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final isSender = messages[index].senderId ==
                          FirebaseAuth.instance.currentUser!.uid;
                      final haveNip = index == 0 ||
                          messages[index].senderId !=
                              messages[index - 1].senderId;

                      // date time
                      final messageDate = dateFormat.format(
                        DateTime.fromMillisecondsSinceEpoch(
                          messages[index].timeSent,
                        ),
                      );
                      final currentDate = dateFormat.format(DateTime.now());
                      final showDate =
                          messageDate == currentDate ? 'Hari ini' : messageDate;
                      final isShowDate = index == 0 ||
                          messageDate !=
                              dateFormat.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    messages[index - 1].timeSent),
                              );

                      if (index == 0) {
                        return Column(
                          children: [
                            const EncriptionCard(),
                            if (isShowDate) DateTimeCard(showDate: showDate),
                            const SizedBox(height: 3),
                            ChatBouble(
                              isSender: isSender,
                              haveNip: haveNip,
                              message: messages[index],
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          if (isShowDate) DateTimeCard(showDate: showDate),
                          ChatBouble(
                            isSender: isSender,
                            haveNip: haveNip,
                            message: messages[index],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ) ??

          // when data null
          const EncriptionCard(),
    );
  }
}
