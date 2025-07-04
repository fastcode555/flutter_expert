import 'package:json2dart_safe/json2dart.dart';

/// 用户资料数据模型
///
/// 用于存储和传递个人中心的用户资料数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ProfileModel {
  /// 用户ID
  final String id;
  /// 昵称
  final String nickname;
  /// 头像URL
  final String avatarUrl;
  /// 封面URL
  final String coverUrl;
  /// 简介
  final String bio;
  /// 性别
  final String gender;
  /// 生日
  final DateTime? birthday;

  const ProfileModel({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.coverUrl,
    required this.bio,
    required this.gender,
    this.birthday,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json.asString('id'),
      nickname: json.asString('nickname'),
      avatarUrl: json.asString('avatarUrl'),
      coverUrl: json.asString('coverUrl'),
      bio: json.asString('bio'),
      gender: json.asString('gender'),
      birthday: json.asInt('birthday') != 0
          ? DateTime.fromMillisecondsSinceEpoch(json.asInt('birthday'))
          : null,
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'coverUrl': coverUrl,
      'bio': bio,
      'gender': gender,
      if (birthday != null) 'birthday': birthday!.millisecondsSinceEpoch,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  ProfileModel copyWith({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? coverUrl,
    String? bio,
    String? gender,
    DateTime? birthday,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }
} 