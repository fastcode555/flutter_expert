import 'package:flutter/material.dart';

/// 好友搜索/添加组件
///
/// 用于搜索用户并发起加好友请求。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class FriendSearchWidget extends StatelessWidget {
  const FriendSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加好友'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: '请输入用户名/ID搜索',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 搜索逻辑
                  },
                  child: const Text('搜索'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // TODO: 展示搜索结果并支持加好友
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://example.com/avatar.png'),
              ),
              title: const Text('搜索结果昵称'),
              subtitle: const Text('ID: 123456'),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: 发起加好友请求
                },
                child: const Text('加好友'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 