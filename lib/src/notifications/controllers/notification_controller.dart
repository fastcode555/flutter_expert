import 'package:get/get.dart';
import '../models/notification_model.dart';

/// 通知控制器
///
/// 负责管理通知列表、标记已读、清空通知等业务逻辑。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class NotificationController extends GetxController {
  /// 通知列表
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  /// 获取通知列表
  ///
  /// 模拟调用API获取通知数据，并更新notificationList。
  /// 实际开发中请替换为真实API请求。
  Future<void> fetchNotifications() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 模拟网络延迟
    notificationList.value = List.generate(
      10,
      (index) => NotificationModel(
        id: 'id_$index',
        type: index % 3 == 0 ? '系统' : (index % 3 == 1 ? '评论' : '点赞'),
        content: '这是第$index条通知的内容',
        timestamp: DateTime.now().subtract(Duration(hours: index)),
        isRead: index % 2 == 0,
      ),
    );
  }

  /// 标记通知为已读
  ///
  /// [notificationId] 通知ID
  /// 遍历列表，找到对应通知并设置为已读。
  void markAsRead(String notificationId) {
    final idx = notificationList.indexWhere((n) => n.id == notificationId);
    if (idx != -1) {
      notificationList[idx] = notificationList[idx].copyWith(isRead: true);
      notificationList.refresh();
    }
  }

  /// 清空所有通知
  ///
  /// 清空通知列表。
  Future<void> clearAll() async {
    await Future.delayed(const Duration(milliseconds: 200)); // 模拟延迟
    notificationList.clear();
  }
} 