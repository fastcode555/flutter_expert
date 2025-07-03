/// 动态（Feed）数据模型
///
/// 用于存储和传递 Facebook 动态流中的单条动态数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class FeedPostModel {
  /// 动态ID
  final String id;
  /// 发布用户ID
  final String userId;
  /// 用户昵称
  final String username;
  /// 用户头像URL
  final String avatarUrl;
  /// 动态内容文本
  final String content;
  /// 图片列表
  final List<String> images;
  /// 发布时间
  final DateTime createdAt;
  /// 点赞数
  final int likeCount;
  /// 评论数
  final int commentCount;

  FeedPostModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.images,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
  });
} 