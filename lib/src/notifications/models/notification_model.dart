/// 通知数据模型
///
/// 用于存储和传递通知相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class NotificationModel {
  /// 通知ID
  final String id;
  /// 通知类型（如：系统、评论、点赞、好友等）
  final String type;
  /// 通知内容
  final String content;
  /// 发生时间
  final DateTime timestamp;
  /// 是否已读
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });
} 