import 'package:flutter/material.dart';

/// 好友列表组件
///
/// 用于展示当前用户的好友列表，支持分组、黑名单等功能。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class FriendListWidget extends StatelessWidget {
  const FriendListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 绑定 FriendController，展示好友数据
    return Scaffold(
      appBar: AppBar(
        title: const Text('好友列表'),
      ),
      body: ListView.builder(
        itemCount: 10, // TODO: 替换为好友数据长度
        itemBuilder: (context, index) {
          // TODO: 替换为真实数据
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/avatar.png'),
            ),
            title: const Text('好友昵称'),
            subtitle: const Text('分组：默认'),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // TODO: 更多操作（如删除、拉黑等）
              },
            ),
            onTap: () {
              // TODO: 进入聊天或好友详情
            },
          );
        },
      ),
    );
  }
} 