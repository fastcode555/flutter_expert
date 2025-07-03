import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../i18n/controllers/locale_controller.dart';
import '../../i18n/models/locale_model.dart';

/// 语言选择页面组件
///
/// 用于切换应用语言。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class LanguageSelectWidget extends StatelessWidget {
  const LanguageSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 支持的语言列表
    final List<LocaleModel> languages = [
      LocaleModel(languageCode: 'zh', countryCode: 'CN', name: '简体中文'),
      LocaleModel(languageCode: 'en', countryCode: 'US', name: 'English'),
      LocaleModel(languageCode: 'es', countryCode: 'ES', name: 'Español'),
    ];
    // 使用GetX监听当前语言
    return GetBuilder<LocaleController>(
      init: LocaleController(),
      builder: (controller) {
        final String currentLang = controller.currentLocale.value.languageCode;
        return Scaffold(
          appBar: AppBar(
            title: const Text('选择语言'),
          ),
          body: ListView(
            children: languages.map((lang) {
              return RadioListTile<String>(
                value: lang.languageCode,
                groupValue: currentLang,
                title: Text(lang.name),
                onChanged: (value) {
                  /// 切换语言
                  /// [value] 选中的语言代码
                  if (value != null && value != currentLang) {
                    controller.changeLocale(lang);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
} 