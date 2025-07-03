import 'package:flutter/material.dart';

/// 消息输入框组件
///
/// 用于输入和发送聊天消息。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class MessageInputWidget extends StatelessWidget {
  const MessageInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: '请输入消息',
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: 发送消息逻辑
            },
            child: const Text('发送'),
          ),
        ],
      ),
    );
  }
} 