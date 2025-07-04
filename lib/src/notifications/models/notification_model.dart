import 'package:json2dart_safe/json2dart.dart';

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

  const NotificationModel({
    required this.id,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json.asString('id'),
      type: json.asString('type'),
      content: json.asString('content'),
      timestamp: json.asInt('timestamp') != 0
          ? DateTime.fromMillisecondsSinceEpoch(json.asInt('timestamp'))
          : DateTime.now(),
      isRead: json.asBool('isRead'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isRead': isRead,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
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
} 