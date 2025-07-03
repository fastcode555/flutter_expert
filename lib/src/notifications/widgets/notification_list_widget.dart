import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 通知列表组件
///
/// 用于展示系统通知、消息通知等各类通知信息。
/// 使用 flutter_tailwind 实现现代化的通知卡片设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class NotificationListWidget extends StatefulWidget {
  const NotificationListWidget({super.key});

  @override
  State<NotificationListWidget> createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {
  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  /// 加载通知数据
  ///
  /// 模拟从服务器加载通知列表
  void _loadNotifications() {
    // TODO: 集成 NotificationController 获取真实数据
    _notifications = [
      {
        'id': '1',
        'type': 'system',
        'title': '系统更新',
        'content': '新版本已发布，包含多项功能优化和bug修复',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'isRead': false,
        'avatar': Icons.system_update,
        'color': Colors.blue,
      },
      {
        'id': '2',
        'type': 'like',
        'title': '张三点赞了你的动态',
        'content': '张三觉得你的动态很赞',
        'timestamp': DateTime.now().subtract(const Duration(hours: 4)),
        'isRead': false,
        'avatar': Icons.thumb_up,
        'color': Colors.red,
      },
      {
        'id': '3',
        'type': 'comment',
        'title': '李四评论了你的动态',
        'content': '李四：这张照片拍得真好！',
        'timestamp': DateTime.now().subtract(const Duration(hours: 6)),
        'isRead': true,
        'avatar': Icons.comment,
        'color': Colors.green,
      },
      {
        'id': '4',
        'type': 'friend',
        'title': '新的好友请求',
        'content': '王五想要添加你为好友',
        'timestamp': DateTime.now().subtract(const Duration(days: 1)),
        'isRead': true,
        'avatar': Icons.person_add,
        'color': Colors.orange,
      },
    ];
  }

  /// 标记通知为已读
  ///
  /// [index] 通知索引
  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  /// 删除通知
  ///
  /// [index] 通知索引
  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
    
    Get.snackbar(
      '',
      '通知已删除',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  /// 全部标记为已读
  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification['isRead'] = true;
      }
    });

    Get.snackbar(
      '',
      '全部通知已标记为已读',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: '通知'.text.black.f18.bold.mk,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: _markAllAsRead,
            child: container.pr16.child(
              '全部已读'.text.blue.f14.mk,
            ),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                _loadNotifications();
                setState(() {});
              },
              child: listview.pv8.builder(
                _notifications.length,
                (context, index) => _buildNotificationItem(index),
              ),
            ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return container.wFull.hFull.center.child(
      column.center.children([
        Icons.notifications_none.icon.grey400.s64.mk,
        h16,
        '暂无通知'.text.grey600.f16.mk,
        h8,
        '下拉刷新试试'.text.grey400.f14.mk,
      ]),
    );
  }

  /// 构建通知项
  ///
  /// [index] 通知索引
  Widget _buildNotificationItem(int index) {
    final notification = _notifications[index];
    final isRead = notification['isRead'] as bool;
    final timestamp = notification['timestamp'] as DateTime;
    final color = notification['color'] as Color;
    final avatar = notification['avatar'] as IconData;

    return Dismissible(
      key: Key(notification['id']),
      direction: DismissDirection.endToStart,
      background: container.red.child(
        row.end.center.children([
          container.pr16.child(
            column.center.children([
              Icons.delete.icon.white.s24.mk,
              h4,
              '删除'.text.white.f12.mk,
            ]),
          ),
        ]),
      ),
      onDismissed: (direction) {
        _deleteNotification(index);
      },
      child: GestureDetector(
        onTap: () => !isRead ? _markAsRead(index) : null,
        child: container.white.mb8.cardShadow.child(
          row.children([
            // 左侧指示器（未读状态）
            container.color(isRead ? Colors.transparent : color).w4.h80.mk,
            
            // 头像
            container.color(color.withOpacity(0.1)).s50.circle.ml12.mr12.center.child(
              avatar.icon.color(color).s24.mk,
            ),
            
            // 内容区域
            Expanded(
              child: container.pr16.pv16.child(
                column.children([
                  row.spaceBetween.children([
                    Expanded(
                      child: notification['title'].toString().text
                          .color(isRead ? Colors.grey : Colors.black87)
                          .f14
                          .bold
                          .mk,
                    ),
                    _formatTime(timestamp).text.grey.f12.mk,
                  ]),
                  h8,
                  container.wFull.child(
                    notification['content'].toString().text
                        .color(isRead ? Colors.grey : Colors.black87)
                        .f12
                        .mk,
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  /// 格式化时间显示
  ///
  /// [timestamp] 时间戳
  /// 返回格式化后的时间字符串
  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return '刚刚';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}天前';
    } else {
      return '${timestamp.month}月${timestamp.day}日';
    }
  }
} 