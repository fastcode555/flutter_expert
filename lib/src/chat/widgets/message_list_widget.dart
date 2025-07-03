import 'package:flutter/material.dart';

/// 消息列表组件
///
/// 用于展示当前会话的消息列表，支持文本、图片等多种消息类型。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class MessageListWidget extends StatelessWidget {
  const MessageListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 绑定 MessageController，展示消息数据
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天'),
      ),
      body: ListView.builder(
        itemCount: 10, // TODO: 替换为消息数据长度
        itemBuilder: (context, index) {
          // TODO: 替换为真实数据
          final isMe = index % 2 == 0;
          return Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(isMe ? '我发的消息 $index' : '对方消息 $index'),
            ),
          );
        },
      ),
    );
  }
} 