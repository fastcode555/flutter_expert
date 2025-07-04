import 'package:json2dart_safe/json2dart.dart';

/// 语言/地区数据模型
///
/// 用于存储和传递多语言/国际化相关数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class LocaleModel {
  /// 语言代码（如 zh、en、es）
  final String languageCode;
  /// 国家/地区代码（如 CN、US、ES）
  final String countryCode;
  /// 语言显示名称
  final String name;

  const LocaleModel({
    required this.languageCode,
    required this.countryCode,
    required this.name,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory LocaleModel.fromJson(Map<String, dynamic> json) {
    return LocaleModel(
      languageCode: json.asString('languageCode'),
      countryCode: json.asString('countryCode'),
      name: json.asString('name'),
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'countryCode': countryCode,
      'name': name,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  LocaleModel copyWith({
    String? languageCode,
    String? countryCode,
    String? name,
  }) {
    return LocaleModel(
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      name: name ?? this.name,
    );
  }
} 