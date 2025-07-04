import 'package:flutter_expert/src/i18n/models/locale_model.dart';
import 'package:get/get.dart';

/// 语言/国际化控制器
///
/// 负责管理当前语言、切换语言等国际化逻辑。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class LocaleController extends GetxController {
  /// 当前语言
  final Rx<LocaleModel> currentLocale = const LocaleModel(languageCode: 'zh', countryCode: 'CN', name: '简体中文').obs;

  /// 切换语言
  /// [locale] 目标语言
  void changeLocale(LocaleModel locale) {
    // TODO: 切换语言逻辑
    currentLocale.value = locale;
  }
} 