import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 消息列表组件
///
/// 用于展示当前会话的消息列表，支持文本、图片等多种消息类型。
/// 使用 flutter_tailwind 实现现代化的聊天气泡设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class MessageListWidget extends StatefulWidget {
  const MessageListWidget({super.key});

  @override
  State<MessageListWidget> createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  /// 加载消息数据
  ///
  /// 模拟从服务器加载聊天消息
  void _loadMessages() {
    // TODO: 集成 MessageController 获取真实数据
    _messages.addAll([
      {
        'id': '1',
        'content': '你好，在吗？',
        'isMe': false,
        'timestamp': DateTime.now().subtract(const Duration(minutes: 30)),
        'type': 'text',
      },
      {
        'id': '2',
        'content': '在的，有什么事吗？',
        'isMe': true,
        'timestamp': DateTime.now().subtract(const Duration(minutes: 29)),
        'type': 'text',
      },
      {
        'id': '3',
        'content': '今天天气不错，一起出去走走吧！',
        'isMe': false,
        'timestamp': DateTime.now().subtract(const Duration(minutes: 25)),
        'type': 'text',
      },
      {
        'id': '4',
        'content': '好呀，什么时候？',
        'isMe': true,
        'timestamp': DateTime.now().subtract(const Duration(minutes: 24)),
        'type': 'text',
      },
      {
        'id': '5',
        'content': '下午两点，老地方见！',
        'isMe': false,
        'timestamp': DateTime.now().subtract(const Duration(minutes: 20)),
        'type': 'text',
      },
    ]);
  }

  /// 发送消息
  ///
  /// [content] 消息内容
  void _sendMessage(String content) {
    if (content.trim().isEmpty) return;

    final newMessage = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'content': content,
      'isMe': true,
      'timestamp': DateTime.now(),
      'type': 'text',
    };

    setState(() {
      _messages.add(newMessage);
    });

    // 滚动到底部
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: row.children([
          container.s40.circle.grey200.child(
            Icons.person.icon.grey600.s20.mk,
          ),
          w12,
          column.children([
            '好友昵称'.text.black.f16.bold.mk,
            '在线'.text.green.f12.mk,
          ]),
        ]),
        actions: [
          GestureDetector(
            onTap: () {
              Get.snackbar('提示', '更多操作功能开发中');
            },
            child: container.pr16.child(
              Icons.more_horiz.icon.black.s24.mk,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: column.children([
        // 消息列表
        Expanded(
          child: _messages.isEmpty
              ? _buildEmptyState()
              : listview
                  .scrollController(_scrollController)
                  .pv16
                  .ph8
                  .dataBuilder<Map<String, dynamic>>(
                    _messages,
                    (context, index, message) => _buildMessageBubble(message),
                  ),
        ),
        // 输入框
        _buildMessageInput(),
      ]),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return container.wFull.hFull.center.child(
      column.center.children([
        Icons.chat_bubble_outline.icon.grey400.s64.mk,
        h16,
        '开始聊天吧'.text.grey600.f16.mk,
        h8,
        '发送一条消息破冰'.text.grey400.f14.mk,
      ]),
    );
  }

  /// 构建消息气泡
  ///
  /// [message] 消息数据
  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isMe = message['isMe'] as bool;
    final content = message['content'] as String;
    final timestamp = message['timestamp'] as DateTime;

    return container.wFull.mb12.child(
      row.children([
        if (!isMe) ...[
          container.s32.circle.grey200.child(
            Icons.person.icon.grey600.s16.mk,
          ),
          w8,
        ],
        if (isMe) const Spacer(),
        
        // 消息内容
        Flexible(
          child: container
              .color(isMe ? Colors.blue : Colors.white)
              .rounded12
              .p12
              .cardShadow
              .child(
            column.children([
              content.text
                  .color(isMe ? Colors.white : Colors.black87)
                  .f14
                  .mk,
              h4,
              '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}'
                  .text
                  .color(isMe ? Colors.white70 : Colors.grey)
                  .f10
                  .mk,
            ]),
          ),
        ),
        
        if (!isMe) const Spacer(),
        if (isMe) ...[
          w8,
          container.s32.circle.blue100.child(
            Icons.person.icon.blue.s16.mk,
          ),
        ],
      ]),
    );
  }

  /// 构建消息输入框
  Widget _buildMessageInput() {
    final inputController = TextEditingController();

    return container.white.p16.child(
      row.children([
        // 输入框
        Expanded(
          child: container.grey100.rounded20.ph16.pv8.child(
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                hintText: '输入消息...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 14),
              onSubmitted: (value) {
                _sendMessage(value);
                inputController.clear();
              },
            ),
          ),
        ),
        w12,
        // 发送按钮
        GestureDetector(
          onTap: () {
            _sendMessage(inputController.text);
            inputController.clear();
          },
          child: container.blue.circle.p8.child(
            Icons.send.icon.white.s20.mk,
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
} 