import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 设置主页面组件
///
/// 用于展示和修改通知、隐私、语言、账号等设置项。
/// 使用 flutter_tailwind 实现现代化的设置界面设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  bool _notificationEnabled = true;
  bool _privacyEnabled = false;
  String _currentLanguage = '简体中文';
  String _userEmail = 'user@example.com';

  /// 切换通知设置
  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
    Get.snackbar(
      '设置',
      value ? '已开启通知' : '已关闭通知',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  /// 切换隐私保护
  void _togglePrivacy(bool value) {
    setState(() {
      _privacyEnabled = value;
    });
    Get.snackbar(
      '设置',
      value ? '已开启隐私保护' : '已关闭隐私保护',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  /// 跳转语言设置
  void _goToLanguageSettings() {
    Get.snackbar(
      '提示',
      '语言设置功能开发中',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// 跳转账号信息
  void _goToAccountInfo() {
    Get.snackbar(
      '提示',
      '账号信息功能开发中',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// 退出登录
  void _logout() {
    Get.dialog(
      AlertDialog(
        title: '确认退出'.text.black.f16.bold.mk,
        content: '确定要退出当前账号吗？'.text.black87.f14.mk,
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: '取消'.text.grey.f14.mk,
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar('提示', '退出登录功能开发中');
            },
            child: '确定'.text.red.f14.mk,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '设置'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: column.children([
          h16,
          
          // 通知设置分组
          _buildSectionTitle('通知设置'),
          _buildSettingItem(
            '推送通知',
            '接收消息和活动推送',
            Icons.notifications_outlined,
            trailing: Switch(
              value: _notificationEnabled,
              onChanged: _toggleNotification,
              activeColor: Colors.blue,
            ),
          ),
          
          h24,
          
          // 隐私设置分组
          _buildSectionTitle('隐私设置'),
          _buildSettingItem(
            '隐私保护',
            '保护个人信息安全',
            Icons.security,
            trailing: Switch(
              value: _privacyEnabled,
              onChanged: _togglePrivacy,
              activeColor: Colors.blue,
            ),
          ),
          
          h24,
          
          // 通用设置分组
          _buildSectionTitle('通用设置'),
          _buildSettingItem(
            '语言设置',
            _currentLanguage,
            Icons.language,
            onTap: _goToLanguageSettings,
          ),
          _buildSettingItem(
            '账号信息',
            _userEmail,
            Icons.account_circle,
            onTap: _goToAccountInfo,
          ),
          _buildSettingItem(
            '关于我们',
            '版本信息和帮助',
            Icons.info_outline,
            onTap: () {
              Get.snackbar('提示', '关于我们功能开发中');
            },
          ),
          
          h32,
          
          // 退出登录
          GestureDetector(
            onTap: _logout,
            child: container.white.ph20.pv16.child(
              row.center.children([
                Icons.logout.icon.red.s20.mk,
                w12,
                '退出登录'.text.red.f14.bold.mk,
              ]),
            ),
          ),
          
          h32,
        ]),
      ),
    );
  }

  /// 构建分组标题
  ///
  /// [title] 分组标题
  Widget _buildSectionTitle(String title) {
    return container.wFull.ph20.pv8.child(
      title.text.grey600.f12.bold.mk,
    );
  }

  /// 构建设置项
  ///
  /// [title] 标题
  /// [subtitle] 副标题
  /// [icon] 图标
  /// [onTap] 点击回调
  /// [trailing] 尾部组件
  Widget _buildSettingItem(
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: container.white.mb2.child(
        row.children([
          // 图标
          container.s40.circle.grey100.ml16.mr16.center.child(
            icon.icon.grey600.s20.mk,
          ),
          
          // 内容区域
          Expanded(
            child: container.pr16.pv16.child(
              row.spaceBetween.children([
                column.expanded.crossStart.children([
                  title.text.black87.f14.bold.maxLine1.ellipsis.start.mk,
                  h4,
                  subtitle.text.grey.f12.maxLine1.ellipsis.start.mk,
                ]),
                trailing ?? Icons.chevron_right.icon.grey400.s20.mk,
              ]),
            ),
          ),
        ]),
      ),
    );
  }
} 