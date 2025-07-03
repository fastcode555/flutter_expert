import 'package:flutter/material.dart';

/// 登录界面组件
///
/// 提供用户名、密码输入与登录按钮，UI风格采用标准Flutter组件。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('登录', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 16),
                const Text('用户名', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(),
                const SizedBox(height: 16),
                const Text('密码', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(obscureText: true),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 登录逻辑
                    },
                    child: const Text('登录', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('没有账号？', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        // TODO: 跳转注册
                      },
                      child: const Text('去注册'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: 跳转找回密码
                    },
                    child: const Text('忘记密码？', style: TextStyle(color: Colors.redAccent)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 