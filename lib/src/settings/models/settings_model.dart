/// 设置项数据模型
///
/// 用于存储和传递设置相关数据（如通知、隐私、语言、账号等）。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
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
} 