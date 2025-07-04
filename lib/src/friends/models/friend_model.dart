import 'package:json2dart_safe/json2dart.dart';

/// 好友数据模型
///
/// 用于存储和传递好友相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class FriendModel {
  /// 好友ID
  final String id;
  /// 昵称
  final String nickname;
  /// 头像URL
  final String avatarUrl;
  /// 分组
  final String group;
  /// 状态（如：正常、黑名单、待验证等）
  final String status;

  const FriendModel({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.group,
    required this.status,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      id: json.asString('id'),
      nickname: json.asString('nickname'),
      avatarUrl: json.asString('avatarUrl'),
      group: json.asString('group'),
      status: json.asString('status'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'group': group,
      'status': status,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  FriendModel copyWith({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? group,
    String? status,
  }) {
    return FriendModel(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      group: group ?? this.group,
      status: status ?? this.status,
    );
  }
} 