import 'package:flutter/material.dart';
import 'package:flutter_expert/src/settings/widgets/language_select_widget.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 设置页面组件
///
/// 提供应用的各种设置选项，包括通知设置、隐私设置、账户管理等。
/// 支持主题切换、语言选择、清除缓存等功能。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SettingsPageWidget extends StatelessWidget {
  const SettingsPageWidget({super.key});

  /// 跳转语言选择页面
  void _goToLanguageSelect() {
    Get.to(() => const LanguageSelectWidget());
  }

  /// 清除缓存
  void _clearCache() {
    Get.dialog(
      AlertDialog(
        title: const Text('清除缓存'),
        content: const Text('确定要清除应用缓存吗？'),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                '提示',
                '缓存清除成功',
                snackPosition: SnackPosition.TOP,
              );
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  /// 退出登录
  void _logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出当前账户吗？'),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                '提示',
                '已退出登录',
                snackPosition: SnackPosition.TOP,
              );
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '设置'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: column.spacing16.children([
          // 账户设置
          _buildSectionTitle('账户设置'),
          _buildSettingItem('编辑资料', '修改头像、昵称等个人信息', Icons.person),
          _buildSettingItem('账户安全', '密码、验证等安全设置', Icons.security),
          _buildSettingItem('隐私设置', '谁可以看到我的信息', Icons.privacy_tip),
          
          // 通用设置
          _buildSectionTitle('通用设置'),
          _buildSettingItem('通知设置', '推送通知、消息提醒', Icons.notifications),
          _buildSettingItem('语言', '简体中文', Icons.language, onTap: _goToLanguageSelect),
          _buildSettingItem('主题模式', '浅色模式', Icons.brightness_6),
          
          // 其他设置
          _buildSectionTitle('其他'),
          _buildSettingItem('清除缓存', '清理应用缓存数据', Icons.cleaning_services, onTap: _clearCache),
          _buildSettingItem('检查更新', '当前版本 v1.0.0', Icons.system_update),
          _buildSettingItem('关于我们', '应用信息和版权', Icons.info),
          _buildSettingItem('退出登录', '退出当前账户', Icons.logout, onTap: _logout),
          
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
                column.expanded.crossStart.spacing4.children([
                  title.text.black87.f14.bold.maxLine1.ellipsis.start.mk,
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