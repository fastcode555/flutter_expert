/// 通知数据模型
///
/// 用于存储和传递通知相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
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

  /// 创建模型副本
  ///
  /// 可以选择性地更新特定字段
  NotificationModel copyWith({
    String? id,
    String? type,
    String? content,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }

  /// 从 JSON 创建模型实例
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
} 