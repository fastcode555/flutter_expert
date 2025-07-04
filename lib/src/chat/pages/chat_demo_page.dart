import 'package:flutter/material.dart';
import 'package:flutter_expert/src/chat/widgets/conversation_list_widget.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 聊天演示页面
///
/// 作为聊天功能的入口页面，展示会话列表和基本聊天交互。
/// 这是一个演示页面，展示UI和交互体验。
///
/// 创建时间：2024-12-19
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ChatDemoPage extends StatelessWidget {
  const ChatDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: '聊天演示'.text.f20.bold.black.mk,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
      ),
      body: column.spacing20.children([
        // 功能介绍卡片
        _buildIntroCard(),
        // 开始聊天按钮
        _buildActionButtons(),
        // 功能列表
        Expanded(child: _buildFeatureList()),
      ]),
    );
  }

  /// 构建介绍卡片
  Widget _buildIntroCard() {
    return container.m16.p20.white.rounded16.cardShadow.child(
      column.spacing12.children([
        row.spacing12.children([
          Icons.chat_bubble.icon.blue.s32.mk,
          column.crossStart.expanded.children([
            '聊天功能演示'.text.f18.bold.black.mk,
            '体验完整的聊天界面和交互'.text.f14.grey600.mk,
          ]),
        ]),
        '这是一个完整的聊天功能演示，包含会话列表、消息展示、搜索等功能。所有数据均为模拟数据，用于展示UI设计和交互体验。'
            .text.f14.grey700.mk,
      ]),
    );
  }

  /// 构建操作按钮
  Widget _buildActionButtons() {
    return container.ph16.child(
      column.spacing12.children([
        // 进入会话列表
        GestureDetector(
          onTap: () {
            Get.to(
              () => const ConversationListWidget(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300),
            );
          },
          child: container.wFull.h56.blue.rounded12.center.child(
            row.center.spacing12.children([
              Icons.chat.icon.white.s24.mk,
              '进入聊天列表'.text.white.f16.bold.mk,
            ]),
          ),
        ),
        // 快速演示按钮
        GestureDetector(
          onTap: _showDemoInfo,
          child: container.wFull.h48.grey200.rounded12.center.child(
            row.center.spacing8.children([
              Icons.info_outline.icon.grey700.s20.mk,
              '功能说明'.text.grey700.f14.mk,
            ]),
          ),
        ),
      ]),
    );
  }

  /// 构建功能列表
  Widget _buildFeatureList() {
    final features = [
      {
        'icon': Icons.list_alt,
        'title': '会话列表',
        'description': '展示所有聊天会话，支持搜索和排序',
        'color': Colors.blue,
      },
      {
        'icon': Icons.chat_bubble_outline,
        'title': '聊天界面',
        'description': '现代化的聊天气泡设计，支持文本消息',
        'color': Colors.green,
      },
      {
        'icon': Icons.search,
        'title': '搜索功能',
        'description': '快速搜索联系人和聊天记录',
        'color': Colors.orange,
      },
      {
        'icon': Icons.notifications,
        'title': '消息提醒',
        'description': '未读消息数量提醒和在线状态显示',
        'color': Colors.red,
      },
      {
        'icon': Icons.more_horiz,
        'title': '会话操作',
        'description': '置顶、免打扰、删除等会话管理功能',
        'color': Colors.purple,
      },
      {
        'icon': Icons.phone,
        'title': '扩展功能',
        'description': '语音通话、视频通话等功能入口',
        'color': Colors.teal,
      },
    ];

    return container.m16.white.rounded16.cardShadow.child(
      column.children([
        container.p16.borderB1.borderGrey200.child(
          '功能特性'.text.f16.bold.black.mk,
        ),
        Expanded(
          child: listview.p16.separated8.builder(
            features.length,
            (context, index) => _buildFeatureItem(features[index]),
          ),
        ),
      ]),
    );
  }

  /// 构建功能项
  Widget _buildFeatureItem(Map<String, dynamic> feature) {
    return row.spacing16.children([
      container.s40.circle.color(feature['color'] as Color).center.child(
        (feature['icon'] as IconData).icon.white.s20.mk,
      ),
      column.crossStart.spacing2.expanded.children([
        (feature['title'] as String).text.f14.bold.black.mk,
        (feature['description'] as String).text.f12.grey600.mk,
      ]),
    ]);
  }

  /// 显示演示信息
  void _showDemoInfo() {
    Get.dialog(
      AlertDialog(
        title: row.spacing12.children([
          Icons.info_outline.icon.blue.s24.mk,
          '演示说明'.text.f18.bold.mk,
        ]),
        content: column.crossStart.spacing12.children([
          '🎯 这是一个纯UI演示项目'.text.f14.mk,
          '📱 所有数据均为模拟数据'.text.f14.mk,
          '💬 展示现代化聊天界面设计'.text.f14.mk,
          '🔄 支持基本的交互操作'.text.f14.mk,
          '✨ 使用 Flutter Tailwind 样式库'.text.f14.mk,
        ]),
        actions: [
          '了解'.textButton.blue.click(
            onTap: Get.back,
          ),
        ],
      ),
    );
  }
} 
