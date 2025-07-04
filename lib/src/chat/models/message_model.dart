import 'package:json2dart_safe/json2dart.dart';

/// 消息数据模型
///
/// 用于存储和传递单条聊天消息的数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
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

  const MessageModel({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isRead,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json.asString('id'),
      fromUserId: json.asString('fromUserId'),
      toUserId: json.asString('toUserId'),
      content: json.asString('content'),
      type: json.asString('type'),
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
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'content': content,
      'type': type,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isRead': isRead,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  MessageModel copyWith({
    String? id,
    String? fromUserId,
    String? toUserId,
    String? content,
    String? type,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return MessageModel(
      id: id ?? this.id,
      fromUserId: fromUserId ?? this.fromUserId,
      toUserId: toUserId ?? this.toUserId,
      content: content ?? this.content,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
} 