import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';
import '../models/notification_model.dart';

/// 通知列表组件
///
/// 用于展示当前用户的通知列表，支持标记已读、清空等功能。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());
    // 初始化加载通知
    controller.fetchNotifications();
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () async {
              await controller.clearAll();
              Get.snackbar('提示', '所有通知已清空');
            },
          ),
        ],
      ),
      body: Obx(() {
        final List<NotificationModel> list = controller.notificationList;
        if (list.isEmpty) {
          return const Center(child: Text('暂无通知'));
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final n = list[index];
            return ListTile(
              leading: Icon(
                n.isRead ? Icons.notifications_none : Icons.notifications_active,
                color: n.isRead ? Colors.grey : Colors.blue,
              ),
              title: Text(
                '[${n.type}] ' + n.content,
                style: TextStyle(
                  fontWeight: n.isRead ? FontWeight.normal : FontWeight.bold,
                  color: n.isRead ? Colors.grey : Colors.black,
                ),
              ),
              subtitle: Text(_formatTime(n.timestamp)),
              trailing: n.isRead
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.mark_email_read),
                      tooltip: '标记为已读',
                      onPressed: () {
                        controller.markAsRead(n.id);
                        Get.snackbar('提示', '已标记为已读');
                      },
                    ),
              onTap: () {
                if (!n.isRead) controller.markAsRead(n.id);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('[${n.type}] 通知详情'),
                    content: Text(n.content),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('关闭'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}

/// 时间格式化工具
String _formatTime(DateTime time) {
  final now = DateTime.now();
  final diff = now.difference(time);
  if (diff.inMinutes < 1) return '刚刚';
  if (diff.inHours < 1) return '${diff.inMinutes}分钟前';
  if (diff.inDays < 1) return '${diff.inHours}小时前';
  return '${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}';
} 