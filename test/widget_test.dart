// Flutter Expert 应用测试
//
// 测试Flutter Expert社交媒体应用的基本功能和组件。

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_expert/main.dart';

void main() {
  testWidgets('Flutter Expert 应用启动测试', (WidgetTester tester) async {
    // 构建我们的应用并触发一个帧
    await tester.pumpWidget(const MyApp());

    // 验证应用标题是否正确显示
    expect(find.text('Flutter Expert'), findsOneWidget);
    
    // 验证主要模块是否存在
    expect(find.text('登录'), findsOneWidget);
    expect(find.text('资料编辑'), findsOneWidget);
    expect(find.text('动态流'), findsOneWidget);
    expect(find.text('聊天'), findsOneWidget);
    expect(find.text('好友列表'), findsOneWidget);
    expect(find.text('通知'), findsOneWidget);
    expect(find.text('设置'), findsOneWidget);
  });

  testWidgets('基本UI元素测试', (WidgetTester tester) async {
    // 构建应用
    await tester.pumpWidget(const MyApp());

    // 验证应用图标是否存在
    expect(find.byIcon(Icons.flutter_dash), findsOneWidget);
    
    // 验证描述文本
    expect(find.text('使用 flutter_tailwind 重构的现代化应用'), findsOneWidget);
    
    // 验证重构成果部分
    expect(find.text('重构成果'), findsOneWidget);
    expect(find.text('完成 Auth 模块重构'), findsOneWidget);
    expect(find.text('完成 Profile 模块重构'), findsOneWidget);
  });

  testWidgets('简化导航测试 - 验证模块存在', (WidgetTester tester) async {
    // 构建应用
    await tester.pumpWidget(const MyApp());
    
    // 等待应用完全加载
    await tester.pumpAndSettle();

    // 验证所有模块都在屏幕上可见
    expect(find.text('登录'), findsOneWidget);
    expect(find.text('资料编辑'), findsOneWidget);
    expect(find.text('动态流'), findsOneWidget);
    expect(find.text('聊天'), findsOneWidget);
    expect(find.text('好友列表'), findsOneWidget);
    expect(find.text('通知'), findsOneWidget);
    expect(find.text('设置'), findsOneWidget);
    
    // 验证每个模块都有对应的点击提示
    expect(find.text('点击体验'), findsNWidgets(7));
  });
}
