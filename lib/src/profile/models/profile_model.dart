/// 用户资料数据模型
///
/// 用于存储和传递个人中心的用户资料数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
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

  ProfileModel({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.coverUrl,
    required this.bio,
    required this.gender,
    this.birthday,
  });
} 