import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'profile_edit_widget.dart';

/// 个人中心主页面组件
///
/// 用于展示用户头像、昵称、封面、简介等个人信息。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final ProfileController profileController = Get.find<ProfileController>();

  /// 模拟用户数据
  final Map<String, dynamic> userProfile = {
    'id': '12345',
    'nickname': '张小明',
    'username': 'zhangxiaoming',
    'bio': '热爱生活，喜欢分享，Flutter开发者 🚀',
    'avatar': 'https://example.com/avatar.png',
    'coverImage': 'https://example.com/cover.png',
    'birthday': '1990-01-01',
    'gender': '男',
    'location': '北京市',
    'joinDate': '2020-06-10',
    'followersCount': 1234,
    'followingCount': 567,
    'postsCount': 89,
  };

  /// 跳转资料编辑页
  void _editProfile() {
    Get.to(() => const ProfileEditWidget());
  }

  /// 查看关注列表
  void _viewFollowing() {
    Get.snackbar(
      '提示',
      '跳转关注列表页面',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 查看粉丝列表
  void _viewFollowers() {
    Get.snackbar(
      '提示',
      '跳转粉丝列表页面',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 查看动态列表
  void _viewPosts() {
    Get.snackbar(
      '提示',
      '跳转我的动态页面',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 分享个人资料
  void _shareProfile() {
    Get.snackbar(
      '提示',
      '分享个人资料功能开发中',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 更多操作
  void _moreActions() {
    Get.bottomSheet(
      container.white.roundedT16.child(
        column.children([
          // 底部弹窗标题
          container.wFull.pv16.child(
            '更多操作'.text.black.f16.bold.center.mk,
          ),
          
          // 操作选项
          _buildBottomSheetItem('分享资料', Icons.share, _shareProfile),
          _buildBottomSheetItem('设置', Icons.settings, () {
            Get.back();
            Get.snackbar('提示', '跳转设置页面', snackPosition: SnackPosition.TOP);
          }),
          _buildBottomSheetItem('意见反馈', Icons.feedback, () {
            Get.back();
            Get.snackbar('提示', '跳转意见反馈页面', snackPosition: SnackPosition.TOP);
          }),
          
          h16,
          
          // 取消按钮
          GestureDetector(
            onTap: () => Get.back(),
            child: container.wFull.grey200.rounded8.mh16.pv12.child(
              '取消'.text.black.f16.center.mk,
            ),
          ),
          h16,
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 应用栏配置
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '个人中心'.text.black.f18.bold.mk,
        actions: [
          container.pr8.child(
            GestureDetector(
              onTap: _editProfile,
              child: Icons.edit.icon.black.s20.mk,
            ),
          ),
          container.pr16.child(
            GestureDetector(
              onTap: _moreActions,
              child: Icons.more_vert.icon.black.s20.mk,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      extendBodyBehindAppBar: true,
      
      // 主体内容
      body: SingleChildScrollView(
        child: column.children([
          // 封面和头像区域
          _buildHeaderSection(),
          h16,
          
          // 用户信息区域
          _buildUserInfoSection(),
          h16,
          
          // 统计数据区域
          _buildStatsSection(),
          h16,
          
          // 操作按钮区域
          _buildActionButtonsSection(),
          h32,
        ]),
      ),
    );
  }

  /// 构建头部区域（封面和头像）
  Widget _buildHeaderSection() {
    return stack.children([
      // 封面图片
      container.wFull.h200.blue100.child(
        // 模拟封面图片
        container.wFull.hFull.center.child(
          '封面图'.text.blue.f16.mk,
        ),
      ),
      
      // 头像
      Positioned(
        left: 20,
        bottom: -40,
        child: container.s80.circle.white.p4.child(
          container.s72.circle.grey200.center.child(
            Icons.person.icon.grey600.s40.mk,
          ),
        ),
      ),
    ]);
  }

  /// 构建用户信息区域
  Widget _buildUserInfoSection() {
    return container.white.wFull.pt50.pb20.ph20.child(
      column.crossStart.children([
        // 昵称
        userProfile['nickname'].toString().text.black.f20.bold.mk,
        h4,
        
        // 用户名
        '@${userProfile['username']}'.text.grey600.f14.mk,
        h12,
        
        // 个人简介
        userProfile['bio'].toString().text.black87.f16.mk,
        h16,
        
        // 详细信息
        wrap.spacing16.runSpacing8.children([
          _buildInfoChip(Icons.cake, '生日', userProfile['birthday']),
          _buildInfoChip(Icons.wc, '性别', userProfile['gender']),
          _buildInfoChip(Icons.location_on, '位置', userProfile['location']),
          _buildInfoChip(Icons.calendar_today, '加入时间', userProfile['joinDate']),
        ]),
      ]),
    );
  }

  /// 构建信息标签
  ///
  /// [icon] 图标
  /// [label] 标签
  /// [value] 值
  Widget _buildInfoChip(IconData icon, String label, String value) {
    return row.children([
      icon.icon.grey600.s16.mk,
      w4,
      '$label：$value'.text.grey600.f12.mk,
    ]);
  }

  /// 构建统计数据区域
  Widget _buildStatsSection() {
    return container.white.wFull.pv20.child(
      row.spaceEvenly.children([
        _buildStatItem('动态', userProfile['postsCount'], _viewPosts),
        _buildStatItem('关注', userProfile['followingCount'], _viewFollowing),
        _buildStatItem('粉丝', userProfile['followersCount'], _viewFollowers),
      ]),
    );
  }

  /// 构建统计项
  ///
  /// [label] 标签
  /// [count] 数量
  /// [onTap] 点击回调
  Widget _buildStatItem(String label, int count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: column.center.children([
        count.toString().text.black.f18.bold.mk,
        h4,
        label.text.grey600.f14.mk,
      ]),
    );
  }

  /// 构建操作按钮区域
  Widget _buildActionButtonsSection() {
    return container.white.wFull.p20.child(
      column.children([
        // 编辑资料按钮
        GestureDetector(
          onTap: _editProfile,
          child: container.wFull.blue.rounded8.pv12.child(
            row.center.children([
              Icons.edit.icon.white.s20.mk,
              w8,
              '编辑资料'.text.white.f16.mk,
            ]),
          ),
        ),
        h12,
        
        // 其他操作按钮
        row.children([
          // 分享资料
          GestureDetector(
            onTap: _shareProfile,
            child: container.expanded.border1.borderBlue.rounded8.pv12.mr6.child(
              row.center.children([
                Icons.share.icon.blue.s20.mk,
                w8,
                '分享'.text.blue.f16.mk,
              ]),
            ),
          ),
          
          // 设置
          GestureDetector(
            onTap: () {
              Get.snackbar('提示', '跳转设置页面', snackPosition: SnackPosition.TOP);
            },
            child: container.expanded.border1.borderGrey300.rounded8.pv12.ml6.child(
              row.center.children([
                Icons.settings.icon.grey600.s20.mk,
                w8,
                '设置'.text.grey600.f16.mk,
              ]),
            ),
          ),
        ]),
      ]),
    );
  }

  /// 构建底部弹窗选项
  ///
  /// [title] 标题
  /// [icon] 图标
  /// [onTap] 点击回调
  Widget _buildBottomSheetItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        Get.back();
        onTap();
      },
      child: container.wFull.pv16.ph20.child(
        row.children([
          icon.icon.grey600.s24.mk,
          w16,
          title.text.black.f16.mk,
        ]),
      ),
    );
  }
} 