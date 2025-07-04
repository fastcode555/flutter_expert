import 'package:json2dart_safe/json2dart.dart';

/// 动态（Feed）数据模型
///
/// 用于存储和传递 Facebook 动态流中的单条动态数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
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
  /// 发布时间
  final DateTime createdAt;
  /// 点赞数
  final int likeCount;
  /// 评论数
  final int commentCount;
  /// 图片列表
  final List<String>? images;

  const FeedPostModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    this.images,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory FeedPostModel.fromJson(Map<String, dynamic> json) {
    return FeedPostModel(
      id: json.asString('id'),
      userId: json.asString('userId'),
      username: json.asString('username'),
      avatarUrl: json.asString('avatarUrl'),
      content: json.asString('content'),
      createdAt: json.asInt('createdAt') != 0
          ? DateTime.fromMillisecondsSinceEpoch(json.asInt('createdAt'))
          : DateTime.now(),
      likeCount: json.asInt('likeCount'),
      commentCount: json.asInt('commentCount'),
      images: json.asList<String>('images'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'avatarUrl': avatarUrl,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'likeCount': likeCount,
      'commentCount': commentCount,
      if (images != null && images!.isNotEmpty) 'images': images,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  FeedPostModel copyWith({
    String? id,
    String? userId,
    String? username,
    String? avatarUrl,
    String? content,
    DateTime? createdAt,
    int? likeCount,
    int? commentCount,
    List<String>? images,
  }) {
    return FeedPostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      images: images ?? this.images,
    );
  }
} 