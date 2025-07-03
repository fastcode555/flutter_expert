/// 消息数据模型
///
/// 用于存储和传递单条聊天消息的数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class MessageModel {
  /// 消息ID
  final String id;
  /// 发送者ID
  final String fromUserId;
  /// 接收者ID
  final String toUserId;
  /// 消息内容
  final String content;
  /// 消息类型（text/image/video等）
  final String type;
  /// 发送时间
  final DateTime timestamp;
  /// 是否已读
  final bool isRead;

  MessageModel({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isRead,
  });
} 