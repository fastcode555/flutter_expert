import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 好友列表组件
///
/// 用于展示当前用户的好友列表，支持分组、黑名单等功能。
/// 使用 flutter_tailwind 实现现代化的联系人列表设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class FriendListWidget extends StatefulWidget {
  const FriendListWidget({super.key});

  @override
  State<FriendListWidget> createState() => _FriendListWidgetState();
}

class _FriendListWidgetState extends State<FriendListWidget> {
  List<Map<String, dynamic>> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  /// 加载好友数据
  void _loadFriends() {
    _friends = [
      {
        'id': '1',
        'nickname': '张三',
        'group': '家人',
        'isOnline': true,
      },
      {
        'id': '2',
        'nickname': '李四',
        'group': '同事',
        'isOnline': false,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: '好友列表'.text.black.f18.bold.mk,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.snackbar('提示', '添加好友功能开发中');
            },
            child: container.pr16.child(
              Icons.person_add.icon.black.s24.mk,
            ),
          ),
        ],
      ),
      body: _friends.isEmpty
          ? _buildEmptyState()
          : listview.p16.dataBuilder<Map<String, dynamic>>(
              _friends,
              (context, index, friend) => _buildFriendItem(friend),
            ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return container.wFull.hFull.center.child(
      column.center.children([
        Icons.people_outline.icon.grey400.s64.mk,
        h16,
        '暂无好友'.text.grey600.f16.mk,
        h8,
        '点击右上角添加好友'.text.grey400.f14.mk,
      ]),
    );
  }

  /// 构建好友项
  Widget _buildFriendItem(Map<String, dynamic> friend) {
    final isOnline = friend['isOnline'] as bool;
    
    return GestureDetector(
      onTap: () {
        Get.snackbar('提示', '与 ${friend['nickname']} 聊天功能开发中');
      },
      child: container.white.mb12.rounded12.cardShadow.child(
        row.children([
          // 头像
          container.s50.circle.grey200.ml16.mr16.center.child(
            Icons.person.icon.grey600.s24.mk,
          ),
          
          // 信息区域
          Expanded(
            child: container.pr16.pv16.child(
              column.children([
                row.spaceBetween.children([
                  friend['nickname'].toString().text.black87.f14.bold.maxLine1.ellipsis.start.expanded.mk,
                  container.color(isOnline ? Colors.green : Colors.grey).s8.circle.mk,
                ]),
                h8,
                row.spaceBetween.children([
                  friend['group'].toString().text.grey.f12.mk,
                  GestureDetector(
                    onTap: () {
                      Get.snackbar('提示', '更多操作功能开发中');
                    },
                    child: Icons.more_horiz.icon.grey600.s20.mk,
                  ),
                ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
} 