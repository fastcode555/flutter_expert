import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import '../models/friend_model.dart';

/// 用户详情页面组件
///
/// 用于展示指定用户的详细信息，风格参考微信"查看用户详情"页面。
/// 支持展示头像、昵称、ID、分组、状态、操作按钮等。
///
/// 创建时间：2024-06-11
/// 作者：AI助手
class UserDetailWidget extends StatelessWidget {
  /// 目标用户数据模型
  final FriendModel user;
  /// 是否已是好友
  final bool isFriend;
  
  /// 构造函数
  /// 
  /// [user] 目标用户
  /// [isFriend] 是否为当前用户好友
  const UserDetailWidget({
    Key? key, 
    required this.user, 
    this.isFriend = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "详细资料".text.f18.bold.mk,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: column.children([
          h32,
          
          // 用户头像区域
          container.white.wFull.pv30.child(
            column.center.children([
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
              h16,
              user.nickname.text.f20.bold.mk,
              h8,
              "ID: ${user.id}".text.f14.grey.mk,
            ]),
          ),
          
          h16,
          
          // 用户信息区域
          container.white.wFull.child(
            column.children([
              _buildInfoRow("分组", user.group),
              _buildInfoRow("状态", user.status),
            ]),
          ),
          
          h32,
          
          // 底部按钮区域
          container.white.wFull.p16.child(
            isFriend 
              ? row.children([
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: 发消息功能
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('进入聊天...')),
                        );
                      },
                      child: container.blue.rounded8.pv12.center.child(
                        row.center.children([
                          Icons.message.icon.s16.white.mk,
                          w8,
                          "发消息".text.white.mk,
                        ]),
                      ),
                    ),
                  ),
                  w12,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: 语音通话功能
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('语音通话...')),
                        );
                      },
                      child: container.border1.borderBlue.rounded8.pv12.center.child(
                        row.center.children([
                          Icons.phone.icon.s16.blue.mk,
                          w8,
                          "语音通话".text.blue.mk,
                        ]),
                      ),
                    ),
                  ),
                ])
              : GestureDetector(
                  onTap: () {
                    // TODO: 加好友功能
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('已发送好友请求')),
                    );
                  },
                  child: container.wFull.blue.rounded8.pv12.center.child(
                    row.center.children([
                      Icons.person_add.icon.s16.white.mk,
                      w8,
                      "添加到通讯录".text.white.mk,
                    ]),
                  ),
                ),
          ),
          
          h32,
        ]),
      ),
    );
  }

  /// 显示头像预览
  /// 
  /// 点击头像时调用，显示大图预览
  void _showAvatarPreview() {
    // TODO: 实现头像大图预览功能
  }

  /// 构建信息行组件
  /// 
  /// [label] 标签文本
  /// [value] 值文本
  /// 返回信息行 Widget
  Widget _buildInfoRow(String label, String value) {
    return container.wFull.ph16.pv12.child(
      row.spaceBetween.children([
        label.text.f16.mk,
        value.text.f16.grey.mk,
      ]),
    );
  }
} 