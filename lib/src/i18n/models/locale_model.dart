/// 语言/地区数据模型
///
/// 用于存储和传递多语言/国际化相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class LocaleModel {
  /// 语言代码（如 zh、en、es）
  final String languageCode;
  /// 国家/地区代码（如 CN、US、ES）
  final String countryCode;
  /// 语言显示名称
  final String name;

  LocaleModel({
    required this.languageCode,
    required this.countryCode,
    required this.name,
  });
} 