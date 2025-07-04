import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 登录界面组件
///
/// 提供用户名、密码输入与登录按钮，使用 flutter_tailwind 实现现代化 UI 设计。
/// 支持响应式布局，集成 GetX 状态管理和路由导航。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  /// 执行登录逻辑
  ///
  /// 验证用户输入并处理登录请求
  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.snackbar(
        '提示',
        '请输入用户名和密码',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: 集成 AuthController 处理登录逻辑
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });

    Get.snackbar(
      '成功',
      '登录成功',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// 跳转到注册页面
  void _goToRegister() {
    // TODO: 实现注册页面跳转
    Get.snackbar(
      '提示',
      '注册页面开发中',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 跳转到忘记密码页面
  void _goToForgotPassword() {
    // TODO: 实现忘记密码页面跳转
    Get.snackbar(
      '提示',
      '忘记密码页面开发中',
      snackPosition: SnackPosition.TOP,
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
        title: '登录'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: container.wFull.hFull.child(
          column.children([
            h64,
            
            // Logo 区域
            container.s80.circle.blue100.center.mb32.child(
              Icons.account_circle.icon.blue.s40.mk,
            ),
            
            // 表单卡片
            container.white.ph24.pv24.rounded16.cardShadow.child(
              column.children([
                // 标题
                '欢迎回来'.text.black.f24.bold.center.mk,
                h8,
                '请登录您的账户'.text.grey600.f14.center.mk,
                h32,
                
                // 用户名输入
                _buildInputField(
                  '用户名',
                  '请输入用户名',
                  _usernameController,
                  Icons.person_outline,
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
                
                // 登录按钮
                GestureDetector(
                  onTap: _isLoading ? null : _handleLogin,
                  child: container.wFull.h48.blue.rounded8.center.child(
                    _isLoading
                        ? container.s20.child(
                            const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : '登录'.text.white.f16.bold.mk,
                  ),
                ),
                h24,
                
                // 底部链接
                row.center.children([
                  '没有账号？'.text.grey600.f14.mk,
                  w8,
                  GestureDetector(
                    onTap: _goToRegister,
                    child: '立即注册'.text.blue.f14.bold.mk,
                  ),
                ]),
                h16,
                GestureDetector(
                  onTap: _goToForgotPassword,
                  child: '忘记密码？'.text.red.f14.center.mk,
                ),
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
    super.dispose();
  }
} 