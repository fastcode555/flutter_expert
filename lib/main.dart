import 'package:flutter/material.dart';
import 'package:flutter_expert/src/auth/widgets/login_widget.dart';
import 'package:flutter_expert/src/chat/pages/chat_demo_page.dart';
import 'package:flutter_expert/src/feed/widgets/feed_list_widget.dart';
import 'package:flutter_expert/src/friends/widgets/friend_list_widget.dart';
import 'package:flutter_expert/src/notifications/widgets/notification_list_widget.dart';
import 'package:flutter_expert/src/profile/widgets/profile_edit_widget.dart';
import 'package:flutter_expert/src/settings/widgets/settings_page_widget.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

void main() {
  // 如有必要，可在此初始化 tailwind
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿尺寸
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Expert',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // 初始化 Tailwind 主题
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Tailwind.instance.init(context, Colors.blue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        elevation: 0,
        title: 'Flutter Expert Demo'.text.black.f18.bold.mk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: column.spacing24.children([
          // 应用标题
          container.wFull.center.pv20.child(
            column.center.spacing16.children([
              container.s80.circle.blue100.center.child(
                Icons.flutter_dash.icon.blue.s40.mk,
              ),
              column.center.spacing8.children([
                'Flutter Expert'.text.black.f24.bold.mk,
                '使用 flutter_tailwind 重构的现代化应用'.text.grey600.f14.center.mk,
              ]),
            ]),
          ),
          
          // 功能模块网格
          _buildModuleGrid(),
          
          // 应用信息
          container.white.rounded12.p16.cardShadow.child(
            column.spacing12.children([
              '重构成果'.text.black.f16.bold.mk,
              column.spacing8.children([
                row.spacing8.children([
                  Icons.check_circle.icon.green.s16.mk,
                  '完成 Auth 模块重构'.text.black87.f14.mk,
                ]),
                row.spacing8.children([
                  Icons.check_circle.icon.green.s16.mk,
                  '完成 Profile 模块重构'.text.black87.f14.mk,
                ]),
                row.spacing8.children([
                  Icons.check_circle.icon.green.s16.mk,
                  '完成 Feed 模块重构'.text.black87.f14.mk,
                ]),
                row.spacing8.children([
                  Icons.check_circle.icon.green.s16.mk,
                  '完成 Chat 模块重构'.text.black87.f14.mk,
                ]),
                row.spacing8.children([
                  Icons.check_circle.icon.green.s16.mk,
                  '完成 Settings 模块重构'.text.black87.f14.mk,
                ]),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }

  /// 构建模块网格
  Widget _buildModuleGrid() {
    final modules = [
      {
        'title': '登录',
        'icon': Icons.login,
        'color': Colors.blue,
        'page': const LoginWidget(),
      },
      {
        'title': '资料编辑',
        'icon': Icons.edit,
        'color': Colors.green,
        'page': const ProfileEditWidget(),
      },
      {
        'title': '动态流',
        'icon': Icons.dynamic_feed,
        'color': Colors.orange,
        'page': const FeedListWidget(),
      },
      {
        'title': '聊天',
        'icon': Icons.chat,
        'color': Colors.purple,
        'page': const ChatDemoPage(),
      },
      {
        'title': '好友列表',
        'icon': Icons.people,
        'color': Colors.red,
        'page': const FriendListWidget(),
      },
      {
        'title': '通知',
        'icon': Icons.notifications,
        'color': Colors.amber,
        'page': const NotificationListWidget(),
      },
      {
        'title': '设置',
        'icon': Icons.settings,
        'color': Colors.teal,
        'page': const SettingsPageWidget(),
      },
    ];

    return gridview.crossAxisCount2.spacing12.ratio(1.2).shrinkWrap.neverScroll.builder(
      modules.length,
      (context, index) {
        final module = modules[index];
        return _buildModuleCard(
          module['title']! as String,
          module['icon']! as IconData,
          module['color']! as Color,
          module['page']! as Widget,
        );
      },
    );
  }

  /// 构建模块卡片
  Widget _buildModuleCard(
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(() => page);
      },
      child: container.white.rounded12.cardShadow.child(
        column.center.spacing12.children([
          container.color(color.withOpacity(0.1)).s50.circle.center.child(
            icon.icon.color(color).s24.mk,
          ),
          column.center.spacing4.children([
            title.text.black87.f14.bold.center.mk,
            '点击体验'.text.grey.f12.center.mk,
          ]),
        ]),
      ),
    );
  }
}
