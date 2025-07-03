/// 设置项数据模型
///
/// 用于存储和传递设置相关数据（如通知、隐私、语言、账号等）。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SettingsModel {
  /// 是否开启通知
  final bool notificationEnabled;
  /// 是否开启隐私保护
  final bool privacyEnabled;
  /// 当前语言
  final String language;
  /// 账号信息（如邮箱、手机号等）
  final String account;

  SettingsModel({
    required this.notificationEnabled,
    required this.privacyEnabled,
    required this.language,
    required this.account,
  });

  /// 创建模型副本
  ///
  /// 可以选择性地更新特定字段
  SettingsModel copyWith({
    bool? notificationEnabled,
    bool? privacyEnabled,
    String? language,
    String? account,
  }) {
    return SettingsModel(
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      privacyEnabled: privacyEnabled ?? this.privacyEnabled,
      language: language ?? this.language,
      account: account ?? this.account,
    );
  }

  /// 从 JSON 创建模型实例
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      notificationEnabled: json['notificationEnabled'] as bool,
      privacyEnabled: json['privacyEnabled'] as bool,
      language: json['language'] as String,
      account: json['account'] as String,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'notificationEnabled': notificationEnabled,
      'privacyEnabled': privacyEnabled,
      'language': language,
      'account': account,
    };
  }
} 