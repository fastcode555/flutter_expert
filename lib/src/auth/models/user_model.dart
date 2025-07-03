/// 用户数据模型
///
/// 主要用于存储和传递 Facebook App 用户相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class UserModel {
  /// 用户ID
  final String id;
  /// 用户名
  final String username;
  /// 头像URL
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });
} 