/// 好友数据模型
///
/// 用于存储和传递好友相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
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

  FriendModel({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.group,
    required this.status,
  });
} 