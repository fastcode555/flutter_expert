import 'package:flutter/material.dart';

/// 设置主页面组件
///
/// 用于展示和修改通知、隐私、语言、账号等设置项。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class SettingsPageWidget extends StatelessWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('开启通知'),
            value: true, // TODO: 绑定设置项
            onChanged: (val) {
              // TODO: 切换通知开关
            },
          ),
          SwitchListTile(
            title: const Text('隐私保护'),
            value: false, // TODO: 绑定设置项
            onChanged: (val) {
              // TODO: 切换隐私保护
            },
          ),
          ListTile(
            title: const Text('语言设置'),
            subtitle: const Text('简体中文'), // TODO: 绑定当前语言
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 跳转语言选择页
            },
          ),
          ListTile(
            title: const Text('账号信息'),
            subtitle: const Text('user@example.com'), // TODO: 绑定账号信息
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 跳转账号信息页
            },
          ),
        ],
      ),
    );
  }
} 