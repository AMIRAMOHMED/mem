// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mem/core/networking/api_constants.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/core/networking/dio_factory.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';
import 'package:mem/features/group%20chat/data/model/message_model.dart';
import 'package:mem/features/group%20chat/data/repo/message_repo.dart';
import 'package:mem/features/group%20chat/presentation/widgets/chat_buble.dart';
import 'package:mem/features/group%20chat/presentation/widgets/chat_buble_for_other.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.meeting});
  final GetAllGroupResponseBody meeting;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageRepo _messageRepo = MessageRepo(ApiService(DioFactory.getDio()));
  final token = SharedPref().getString(PrefKeys.accessToken);

  final userId = SharedPref().getString(PrefKeys.userId);
  IO.Socket? socket;
  final TextEditingController _message = TextEditingController();
  final ScrollController _controller = ScrollController();

  List<MessageModel> messagesList = [];

  bool sending = false;

  @override
  void initState() {
    super.initState();
    connect();
    print(userId);
    _scrollToBottom();
  }

  void connect() {
    try {
      socket = IO.io(
        ApiConstants.apiBaseURL,
        IO.OptionBuilder()
            .disableAutoConnect()
            .enableForceNewConnection()
            .setTransports(['websocket']).setExtraHeaders({
          "Authorization": "Bearer $token",
        }).build(),
      );

      socket!.onError((error) {
        print('Socket connection error: $error');
      });

      socket!.connect();

      socket!.on("message", (data) {
        print("Message received: $data");
        final message = data[1];
        final messageModel = MessageModel.fromJson(message);
        setState(() {
          messagesList.add(messageModel);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void sendMessage(String messag, String groupID) {
    sending = true;
    socket!.emitWithAck("message", [groupID, messag], ack: (data) {
      sending = false;
    });
  }

  void _scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  Stream<List<MessageModel>> getMessagesStream() {
    final response =
        _messageRepo.getAllMessageRepo("Bearer $token", "${widget.meeting.id}");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          const SizedBox(
                height: 30,
              ),
              AppBar(
                automaticallyImplyLeading: false,
                title:  HeadContainer(
                  text: "${widget.meeting.name}",
                  color: AppPallete.darkPink,
                ),
              ),
         
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messagesList = snapshot.data!;

                return ListView.builder(
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];

                    return userId == messagesList[index].senderId
                        ? ChatBubble(message: message)
                        : ChatBubleForOther(message: message);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _message,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '..... اكتب رسالة',
                hintStyle: AppStyles.font16LightGray(context),
                prefix: GestureDetector(
                  onTap: () {
                    if (_message.text.isNotEmpty && !sending) {
                      sendMessage(_message.text, "${widget.meeting.id}");
                      print("${widget.meeting.id}");
                      _message.clear();
                    }
                    _scrollToBottom();
                  },
                  child: Image.asset(Assets.sendIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
