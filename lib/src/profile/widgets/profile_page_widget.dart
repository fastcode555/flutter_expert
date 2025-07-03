import 'package:flutter/material.dart';

/// 个人中心主页面组件
///
/// 用于展示用户头像、昵称、封面、简介等个人信息。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 绑定 ProfileController，展示用户资料
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: 跳转资料编辑页
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  color: Colors.blue[100],
                  width: double.infinity,
                  child: const Center(child: Text('封面图')), // TODO: 替换为真实封面
                ),
                Positioned(
                  left: 24,
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://example.com/avatar.png'), // TODO: 替换为真实头像
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Text('昵称', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('个人简介：这里是用户的简介...', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.cake, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text('生日：1990-01-01', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16),
                Icon(Icons.wc, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text('性别：男', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 