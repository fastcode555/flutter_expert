import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 忘记密码界面组件
///
/// 提供邮箱输入与重置密码功能，使用 flutter_tailwind 实现现代化 UI 设计。
/// 支持邮箱验证、发送重置链接等功能。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  /// 发送重置密码邮件
  ///
  /// 验证邮箱地址并发送重置链接
  Future<void> _sendResetEmail() async {
    if (_emailController.text.isEmpty) {
      Get.snackbar(
        '提示',
        '请输入邮箱地址',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (!GetUtils.isEmail(_emailController.text)) {
      Get.snackbar(
        '提示',
        '请输入有效的邮箱地址',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: 集成 AuthController 处理重置密码逻辑
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    Get.snackbar(
      '成功',
      '重置密码邮件已发送，请查收',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '忘记密码'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: container.wFull.hFull.child(
          column.children([
            h64,
            
            // 图标区域
            container.s100.circle.orange100.center.child(
              Icons.lock_reset.icon.orange.s50.mk,
            ),
            h32,
            
            // 表单卡片
            container.white.ph24.pv32.rounded16.cardShadow.child(
              column.children([
                // 标题
                '重置您的密码'.text.black.f24.bold.center.mk,
                h12,
                '输入您的邮箱地址，我们将发送重置密码的链接给您'.text.grey600.f14.center.mk,
                h32,
                
                // 邮箱输入
                _buildEmailInput(),
                h32,
                
                // 发送按钮
                GestureDetector(
                  onTap: _isLoading ? null : _sendResetEmail,
                  child: container.wFull.h48.orange.rounded8.center.child(
                    _isLoading
                        ? container.s20.child(
                            const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : '发送重置邮件'.text.white.f16.bold.mk,
                  ),
                ),
                h24,
                
                // 返回登录链接
                GestureDetector(
                  onTap: Get.back,
                  child: '返回登录'.text.blue.f14.center.mk,
                ),
              ]),
            ),
            h48,
            
            // 帮助信息
            container.white.ph20.pv16.rounded8.child(
              column.children([
                row.children([
                  Icons.info_outline.icon.blue.s20.mk,
                  w12,
                  Expanded(
                    child: '如果您没有收到邮件，请检查垃圾邮件文件夹'.text.grey600.f12.mk,
                  ),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  /// 构建邮箱输入框
  Widget _buildEmailInput() {
    return column.children([
      container.wFull.child(
        '邮箱地址'.text.black87.f14.bold.mk,
      ),
      h8,
      container.wFull.h48.border1.borderGrey300.rounded8.ph12.child(
        row.children([
          Icons.email_outlined.icon.grey600.s20.mk,
          w12,
          Expanded(
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: '请输入您的邮箱地址',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ]),
      ),
    ]);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
} 