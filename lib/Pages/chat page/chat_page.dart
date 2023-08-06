import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mime/mime.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

import '../../Themes/themes.dart';
import '../../Utils/utils.dart';
import '../../models/send_items_model.dart';
import '../../widgets/underline_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<SendMenuItems> menuItems = [];

  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  TextEditingController sendController = TextEditingController(text: "");

  FocusNode sendFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    sendFocus.addListener(
      () {
        setState(() {});
      },
    );

    menuItems = [
      SendMenuItems(
        text: "Photos",
        icons: Icons.image,
        color: Colors.amber,
        onTap: _handleImageSelection,
      ),
      SendMenuItems(
        text: "Document",
        icons: Icons.insert_drive_file,
        color: Colors.blue,
        onTap: _handleFileSelection,
      ),
      SendMenuItems(
        text: "Audio",
        icons: Icons.music_note,
        color: Colors.orange,
        onTap: () {},
      ),
      SendMenuItems(
        text: "Cancel",
        icons: EvaIcons.close,
        color: Colors.red,
        onTap: () {
          Get.back();
        },
      ),
    ];
    _loadMessages();
  }

  bool isRTL(String text) {
    if (text == "") return true;
    return intl.Bidi.detectRtlDirectionality(text);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.25,
            color: const Color(0xff737373),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  spaceY(16),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  spaceY(10),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          onTap: menuItems[index].onTap,
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              menuItems[index].icons,
                              size: 20,
                              color: menuItems[index].color.shade400,
                            ),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
    // showModalBottomSheet<void>(
    //   backgroundColor: Colors.white,
    //   context: context,
    //   builder: (BuildContext context) => SafeArea(
    //     child: SizedBox(
    //       height: 144,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               _handleImageSelection();
    //             },
    //             child: const Align(
    //               alignment: AlignmentDirectional.centerStart,
    //               child: Text('Photo'),
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               _handleFileSelection();
    //             },
    //             child: const Align(
    //               alignment: AlignmentDirectional.centerStart,
    //               child: Text('File'),
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () => Navigator.pop(context),
    //             child: const Align(
    //               alignment: AlignmentDirectional.centerStart,
    //               child: Text('Cancel'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );
      Get.back();

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      Get.back();
      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    // if (message is types.FileMessage) {
    //   var localPath = message.uri;

    //   if (message.uri.startsWith('http')) {
    //     try {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: true,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });

    //       final client = http.Client();
    //       final request = await client.get(Uri.parse(message.uri));
    //       final bytes = request.bodyBytes;
    //       final documentsDir = (await getApplicationDocumentsDirectory()).path;
    //       localPath = '$documentsDir/${message.name}';

    //       if (!File(localPath).existsSync()) {
    //         final file = File(localPath);
    //         await file.writeAsBytes(bytes);
    //       }
    //     } finally {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: null,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });
    //     }
    //   }

    //   await OpenFilex.open(localPath);
    // }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(100.0.w, 2.0.h),
              child: const Divider(
                color: Colors.grey,
                thickness: 0.5,
              )),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/image.png"),
              ),
              spaceX(20),
              coloredText(text: "Lorem Ipsum", fontSize: 15.0.sp),
            ],
          ),
        ),
        body: Theme(
          data: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppThemes.colorCustom),
              primaryColor: Colors.white),
          child: Chat(
            messages: _messages,
            customBottomWidget: Container(
              padding: const EdgeInsets.all(20),
              child: SendMessageTextField(
                focusNode: sendFocus,
                hintText: "Type a message",
                textDirection: isRTL(sendController.text)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                suffixIcon: GestureDetector(
                    onTap: () {
                      _handleSendPressed(
                        types.PartialText(
                          text: sendController.text,
                        ),
                      );
                      sendController.text = "";
                    },
                    child: Icon(
                      Icons.send,
                      color: sendController.text == ""
                          ? const Color(0xff919191)
                          : Theme.of(context).colorScheme.secondary,
                    )),

                prefixIcon: GestureDetector(
                  onTap: () {
                    _handleAttachmentPressed();
                  },
                  child: const Icon(
                    EvaIcons.attach,
                    color: Color(0xff919191),
                  ),
                ),

                controller: sendController,
                onchanged: (s) {
                  setState(() {});
                },
                // textDirection: TextDirection.ltr,
              ),
            ),
            customDateHeaderText: (p0) =>
                intl.DateFormat('dd-MMMM-' 'yyyy').format(p0),
            onAttachmentPressed: _handleAttachmentPressed,
            theme: DefaultChatTheme(
              primaryColor: Theme.of(context).colorScheme.primary,
            ),
            onMessageTap: _handleMessageTap,
            onPreviewDataFetched: _handlePreviewDataFetched,
            onSendPressed: _handleSendPressed,
            showUserAvatars: true,
            showUserNames: true,
            user: _user,
          ),
        ),
      );
}
