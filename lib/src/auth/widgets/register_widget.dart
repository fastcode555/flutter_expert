import 'package:flutter/material.dart';

/// 注册界面组件
///
/// 提供用户名、密码、邮箱输入与注册按钮，UI风格采用标准Flutter组件。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('注册', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 16),
                const Text('用户名', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(),
                const SizedBox(height: 16),
                const Text('密码', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(obscureText: true),
                const SizedBox(height: 16),
                const Text('邮箱', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 注册逻辑
                    },
                    child: const Text('注册', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('已有账号？', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        // TODO: 跳转登录
                      },
                      child: const Text('去登录'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 