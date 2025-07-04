import 'package:json2dart_safe/json2dart.dart';

/// 用户数据模型
///
/// 主要用于存储和传递 Facebook App 用户相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class UserModel {
  /// 用户ID
  final String id;
  /// 用户名
  final String username;
  /// 头像URL
  final String avatarUrl;

  const UserModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.asString('id'),
      username: json.asString('username'),
      avatarUrl: json.asString('avatarUrl'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'avatarUrl': avatarUrl,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  UserModel copyWith({
    String? id,
    String? username,
    String? avatarUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
} 