import 'package:flutter/material.dart';

/// 找回密码界面组件
///
/// 提供邮箱输入与找回密码按钮，UI风格采用标准Flutter组件。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('找回密码'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('找回密码', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 16),
                const Text('邮箱', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                const TextField(),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 找回密码逻辑
                    },
                    child: const Text('发送重置邮件', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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