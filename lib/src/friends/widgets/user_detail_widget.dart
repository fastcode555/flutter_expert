import 'package:flutter/material.dart';
import 'package:flutter_expert/src/friends/models/friend_model.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 用户详情页面组件
///
/// 显示用户的详细信息，包括头像、昵称、分组、状态等。
/// 提供查看好友资料的完整界面。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class UserDetailWidget extends StatelessWidget {
  final FriendModel user;

  const UserDetailWidget({required this.user, super.key});

  /// 显示头像预览
  void _showAvatarPreview() {
    Get.snackbar('提示', '头像预览功能开发中');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '详细资料'.text.f18.bold.mk,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: column.spacing16.children([
          h32,
          
          // 用户头像区域
          column.white.wFull.pv30.center.spacing16.children([
            GestureDetector(
              onTap: _showAvatarPreview,
              child: container.s80.grey300.rounded8.child(
                user.avatarUrl.isNotEmpty 
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: user.avatarUrl.image.s80.cover.mk,
                    )
                  : Icons.person.icon.s40.grey600.mk,
              ),
            ),
            column.spacing8.children([
              user.nickname.text.f20.bold.mk,
              'ID: ${user.id}'.text.f14.grey.mk,
            ]),
          ]),
          
          // 用户信息区域
          column.white.wFull.children([
            _buildInfoRow('分组', user.group),
            _buildInfoRow('状态', user.status),
          ]),
          
          h32,
          
          // 底部按钮区域
          container.white.wFull.p20.child(
            '发送消息'.elevatedButton.blue.textWhite.wFull.click(
              onTap: () {
                Get.snackbar('提示', '发送消息功能开发中');
              },
            ),
          ),
        ]),
      ),
    );
  }

  /// 构建信息行
  ///
  /// [label] 标签
  /// [value] 值
  Widget _buildInfoRow(String label, String value) {
    return container.wFull.borderB1.borderGrey100.pv16.ph20.child(
      row.spaceBetween.children([
        label.text.grey600.f14.mk,
        value.text.black87.f14.mk,
      ]),
    );
  }
} 