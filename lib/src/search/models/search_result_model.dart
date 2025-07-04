import 'package:json2dart_safe/json2dart.dart';

/// 搜索结果数据模型
///
/// 用于存储和传递搜索结果相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SearchResultModel {
  /// 结果ID
  final String id;
  /// 结果类型（如：用户、动态、群组、话题等）
  final String type;
  /// 标题/主信息
  final String title;
  /// 简介/副信息
  final String subtitle;
  /// 头像或封面URL
  final String imageUrl;

  const SearchResultModel({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json.asString('id'),
      type: json.asString('type'),
      title: json.asString('title'),
      subtitle: json.asString('subtitle'),
      imageUrl: json.asString('imageUrl'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  SearchResultModel copyWith({
    String? id,
    String? type,
    String? title,
    String? subtitle,
    String? imageUrl,
  }) {
    return SearchResultModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
} 