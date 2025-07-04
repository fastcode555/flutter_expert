import 'package:flutter/material.dart';
import 'package:flutter_expert/src/i18n/controllers/locale_controller.dart';
import 'package:flutter_expert/src/i18n/models/locale_model.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 语言选择页面组件
///
/// 用于切换应用语言。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class LanguageSelectWidget extends StatefulWidget {
  const LanguageSelectWidget({super.key});

  @override
  State<LanguageSelectWidget> createState() => _LanguageSelectWidgetState();
}

class _LanguageSelectWidgetState extends State<LanguageSelectWidget> {
  /// 支持的语言列表
  final List<LocaleModel> languages = [
    const LocaleModel(languageCode: 'zh', countryCode: 'CN', name: '简体中文'),
    const LocaleModel(languageCode: 'en', countryCode: 'US', name: 'English'),
    const LocaleModel(languageCode: 'es', countryCode: 'ES', name: 'Español'),
  ];

  /// 切换语言
  ///
  /// [locale] 目标语言配置
  void _changeLanguage(LocaleModel locale) {
    final controller = Get.find<LocaleController>();
    controller.changeLocale(locale);
    
    Get.snackbar(
      '提示',
      '语言已切换为：${locale.name}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    
    // 延迟一秒后返回
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 使用GetX监听当前语言
    return GetBuilder<LocaleController>(
      init: LocaleController(),
      builder: (controller) {
        final currentLang = controller.currentLocale.value.languageCode;
        
        return Scaffold(
          // 应用栏配置
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
              onTap: Get.back,
              child: Icons.arrow_back_ios.icon.black.s20.mk,
            ),
            title: '选择语言'.text.black.f18.bold.mk,
          ),
          backgroundColor: const Color(0xFFF8F9FA),
          
          // 主体内容
          body: column.children([
            h16,
            
            // 语言列表
            listview.shrinkWrap.neverScroll.separated8.ph16.dataBuilder<LocaleModel>(
              languages,
              (context, index, language) => _buildLanguageItem(language, currentLang),
            ),
            
            h24,
            
            // 说明文字
            container.white.p16.child(
              column.spacing4.children([
                '语言说明'.text.black.f16.bold.mk,
                '• 切换语言后将立即生效'.text.grey600.f14.mk,
                '• 支持的语言包括简体中文、英语和西班牙语'.text.grey600.f14.mk,
                '• 部分页面可能需要重新进入才能完全生效'.text.grey600.f14.mk,
              ]),
            ),
          ]),
        );
      },
    );
  }

  /// 构建语言选项
  ///
  /// [language] 语言配置
  /// [currentLang] 当前选中的语言代码
  Widget _buildLanguageItem(LocaleModel language, String currentLang) {
    final isSelected = language.languageCode == currentLang;
    
    return GestureDetector(
      onTap: () => _changeLanguage(language),
      child: container.white.rounded12.cardShadow.child(
        row.children([
          // 语言图标
          _buildLanguageIcon(language.languageCode),
          w16,
          
          // 语言名称
          column.crossStart.expanded.spacing4.children([
            language.name.text.black.f16.bold.mk,
            _getLanguageDescription(language.languageCode).text.grey600.f14.mk,
          ]),
          w16,
          
          // 选中状态指示器
          container.color(isSelected ? Colors.blue : Colors.grey.shade300).s24.circle.center.child(
            isSelected
                ? Icons.check.icon.white.s16.mk
                : const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }

  /// 构建语言图标
  ///
  /// [languageCode] 语言代码
  Widget _buildLanguageIcon(String languageCode) {
    String flag;
    Color bgColor;
    
    switch (languageCode) {
      case 'zh':
        flag = '🇨🇳';
        bgColor = Colors.red.shade50;
      case 'en':
        flag = '🇺🇸';
        bgColor = Colors.blue.shade50;
      case 'es':
        flag = '🇪🇸';
        bgColor = Colors.yellow.shade50;
      default:
        flag = '🌐';
        bgColor = Colors.grey.shade50;
    }
    
    return container.color(bgColor).s50.circle.center.child(
      flag.text.f24.mk,
    );
  }

  /// 获取语言描述
  ///
  /// [languageCode] 语言代码
  String _getLanguageDescription(String languageCode) {
    switch (languageCode) {
      case 'zh':
        return '中文（简体）';
      case 'en':
        return 'English (US)';
      case 'es':
        return 'Español';
      default:
        return '未知语言';
    }
  }
} 