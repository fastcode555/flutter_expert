/// 搜索结果数据模型
///
/// 用于存储和传递搜索结果相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
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

  SearchResultModel({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
} 