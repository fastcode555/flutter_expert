import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 注册界面组件
///
/// 提供用户名、密码、邮箱输入与注册按钮，使用 flutter_tailwind 实现现代化 UI 设计。
/// 支持表单验证、响应式布局和 GetX 状态管理。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  /// 执行注册逻辑
  ///
  /// 验证用户输入并处理注册请求
  void _handleRegister() async {
    if (_usernameController.text.isEmpty || 
        _passwordController.text.isEmpty || 
        _emailController.text.isEmpty) {
      Get.snackbar(
        '提示',
        '请填写完整的注册信息',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: 集成 AuthController 处理注册逻辑
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    Get.snackbar(
      '成功',
      '注册成功，请登录',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// 跳转到登录页面
  void _goToLogin() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '注册'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: container.wFull.hFull.child(
          column.children([
            h48,
            
            // Logo 区域
            container.s80.circle.green100.center.child(
              Icons.person_add.icon.green.s40.mk,
            ),
            h32,
            
            // 表单卡片
            container.white.ph24.pv24.rounded16.cardShadow.child(
              column.children([
                // 标题
                '创建新账户'.text.black.f24.bold.center.mk,
                h8,
                '请填写以下信息完成注册'.text.grey600.f14.center.mk,
                h32,
                
                // 用户名输入
                _buildInputField(
                  '用户名',
                  '请输入用户名',
                  _usernameController,
                  Icons.person_outline,
                ),
                h20,
                
                // 邮箱输入
                _buildInputField(
                  '邮箱',
                  '请输入邮箱地址',
                  _emailController,
                  Icons.email_outlined,
                ),
                h20,
                
                // 密码输入
                _buildInputField(
                  '密码',
                  '请输入密码',
                  _passwordController,
                  Icons.lock_outline,
                  isPassword: true,
                ),
                h32,
                
                // 注册按钮
                GestureDetector(
                  onTap: _isLoading ? null : _handleRegister,
                  child: container.wFull.h48.green.rounded8.center.child(
                    _isLoading
                        ? container.s20.child(
                            const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : '立即注册'.text.white.f16.bold.mk,
                  ),
                ),
                h24,
                
                // 底部链接
                row.center.children([
                  '已有账号？'.text.grey600.f14.mk,
                  w8,
                  GestureDetector(
                    onTap: _goToLogin,
                    child: '立即登录'.text.green.f14.bold.mk,
                  ),
                ]),
              ]),
            ),
            h48,
          ]),
        ),
      ),
    );
  }

  /// 构建输入框组件
  ///
  /// [label] 标签文本
  /// [hint] 提示文本
  /// [controller] 文本控制器
  /// [icon] 前置图标
  /// [isPassword] 是否为密码输入框
  Widget _buildInputField(
    String label,
    String hint,
    TextEditingController controller,
    IconData icon, {
    bool isPassword = false,
  }) {
    return column.children([
      container.wFull.child(
        label.text.black87.f14.bold.mk,
      ),
      h8,
      container.wFull.h48.border1.borderGrey300.rounded8.ph12.child(
        row.children([
          icon.icon.grey600.s20.mk,
          w12,
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: icon == Icons.email_outlined ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintStyle: const TextStyle(
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
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
} 