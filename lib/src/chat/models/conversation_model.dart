import 'package:json2dart_safe/json2dart.dart';

/// 会话数据模型
///
/// 用于存储和传递聊天会话相关数据。
///
/// 创建时间：2024-12-19
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ConversationModel {
  /// 会话ID
  final String id;
  /// 对方用户ID
  final String userId;
  /// 对方昵称
  final String nickname;
  /// 对方头像URL
  final String avatarUrl;
  /// 最后一条消息内容
  final String lastMessage;
  /// 最后消息时间
  final DateTime lastMessageTime;
  /// 未读消息数量
  final int unreadCount;
  /// 是否在线
  final bool isOnline;
  /// 会话状态（normal/muted/blocked）
  final String status;

  const ConversationModel({
    required this.id,
    required this.userId,
    required this.nickname,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.isOnline,
    required this.status,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json.asString('id'),
      userId: json.asString('userId'),
      nickname: json.asString('nickname'),
      avatarUrl: json.asString('avatarUrl'),
      lastMessage: json.asString('lastMessage'),
      lastMessageTime: json.asInt('lastMessageTime') != 0
          ? DateTime.fromMillisecondsSinceEpoch(json.asInt('lastMessageTime'))
          : DateTime.now(),
      unreadCount: json.asInt('unreadCount'),
      isOnline: json.asBool('isOnline'),
      status: json.asString('status'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      'unreadCount': unreadCount,
      'isOnline': isOnline,
      'status': status,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  ConversationModel copyWith({
    String? id,
    String? userId,
    String? nickname,
    String? avatarUrl,
    String? lastMessage,
    DateTime? lastMessageTime,
    int? unreadCount,
    bool? isOnline,
    String? status,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
      status: status ?? this.status,
    );
  }
} 