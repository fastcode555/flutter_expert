# Flutter Expert 项目

> 基于 flutter_tailwind 的现代化 Flutter 应用项目

---

## 🎯 项目简介

Flutter Expert 是一个展示现代化 Flutter 开发的示例项目，采用 flutter_tailwind 链式调用 API 进行 UI 构建，集成 GetX 状态管理，提供完整的社交应用功能模块。

## 📋 功能模块

### ✅ 已完成模块

#### 🔐 Auth 模块
- **登录页面** (`LoginWidget`) - 用户名密码登录，支持验证和错误提示
- **注册页面** (`RegisterWidget`) - 用户注册，包含邮箱验证
- **忘记密码** (`ForgotPasswordWidget`) - 密码重置功能

#### 👤 Profile 模块  
- **资料编辑** (`ProfileEditWidget`) - 昵称、头像、封面、简介、性别、生日编辑

#### 📱 Feed 模块
- **动态流** (`FeedListWidget`) - 动态列表展示，支持点赞、评论、分享

#### 💬 Chat 模块
- **消息列表** (`MessageListWidget`) - 聊天界面，支持发送消息、表情

#### 👥 Friends 模块
- **好友列表** (`FriendListWidget`) - 好友管理，支持分组、在线状态
- **用户详情** (`UserDetailWidget`) - 好友资料查看，支持添加好友

#### 🔔 Notifications 模块
- **通知列表** (`NotificationListWidget`) - 系统通知、消息通知管理

#### ⚙️ Settings 模块
- **设置页面** (`SettingsPageWidget`) - 通知、隐私、语言、账号设置

### 🏗️ 技术架构

#### 核心技术栈
- **Flutter 3.24.5** - 跨平台 UI 框架
- **flutter_tailwind ^1.6.1** - 链式调用 UI 构建库
- **GetX ^4.6.5** - 状态管理和路由管理
- **flutter_screenutil ^5.9.3** - 屏幕适配方案

#### 项目结构
```
lib/
├── main.dart                 # 应用入口
├── src/
│   ├── auth/                # 认证模块
│   │   ├── controllers/     # 控制器
│   │   ├── models/         # 数据模型
│   │   └── widgets/        # UI 组件
│   ├── profile/            # 资料模块
│   ├── feed/               # 动态模块
│   ├── chat/               # 聊天模块
│   ├── friends/            # 好友模块
│   ├── notifications/      # 通知模块
│   ├── settings/           # 设置模块
│   ├── search/             # 搜索模块
│   ├── i18n/               # 国际化
│   ├── security/           # 安全工具
│   └── common/             # 公共组件
└── l10n/                   # 多语言资源
```

## 🚀 快速开始

### 环境要求
- Flutter SDK >= 3.24.5
- Dart >= 3.5.0
- FVM (Flutter Version Management)

### 安装步骤

1. **克隆项目**
```bash
git clone <repository-url>
cd flutter_expert
```

2. **安装 FVM 并配置 Flutter 版本**
```bash
fvm install 3.24.5
fvm use 3.24.5
```

3. **安装依赖**
```bash
fvm flutter pub get
```

4. **运行应用**
```bash
fvm flutter run
```

## 🎨 flutter_tailwind 使用示例

### 基础组件用法

#### 文本组件
```dart
'Hello World'.text.red.f16.bold.mk
'副标题'.text.grey600.f14.mk
```

#### 容器组件
```dart
container.white.ph16.pv12.rounded12.cardShadow.child(
  '内容'.text.black87.f14.mk
)
```

#### 按钮组件
```dart
GestureDetector(
  onTap: () => _handleLogin(),
  child: container.blue.rounded8.pv12.center.child(
    '登录'.text.white.f14.bold.mk,
  ),
)
```

#### 布局组件
```dart
// 行布局
row.spaceBetween.children([
  widget1,
  widget2,
])

// 列布局
column.children([
  widget1,
  h16, // 间距
  widget2,
])
```

## 📱 功能演示

### 主页导航
应用启动后显示功能模块网格，点击任意模块可进入对应页面：

- 🔐 **登录** - 用户认证界面
- ✏️ **资料编辑** - 个人信息编辑
- 📰 **动态流** - 社交动态展示
- 💬 **聊天** - 实时消息交流
- 👥 **好友列表** - 联系人管理
- 🔔 **通知** - 消息通知中心
- ⚙️ **设置** - 应用配置中心

### UI 特性
- 🎨 **现代化设计** - 采用卡片式布局和圆角设计
- 📱 **响应式适配** - 支持不同屏幕尺寸自适应
- 🌈 **主题色彩** - 蓝色主题配色方案
- ✨ **交互动效** - 流畅的点击和切换动画
- 🔄 **下拉刷新** - 列表页面支持下拉刷新

## 🛠️ 开发规范

### 代码风格
- 使用 2 个空格缩进
- 类名使用大驼峰命名（UpperCamelCase）
- 变量和方法使用小驼峰命名（lowerCamelCase）
- 每个类和方法必须有注释说明

### flutter_tailwind 使用规范
```dart
// ✅ 正确用法
'文本'.text.red.f16.bold.mk
container.white.p16.rounded8.mk

// ❌ 错误用法  
Text('文本', style: TextStyle(color: Colors.red))
Container(color: Colors.white, padding: EdgeInsets.all(16))
```

### 文件组织规范
- 每个业务模块单独建立文件夹
- 模块内按 models、controllers、widgets 分层
- 公共组件放在 common 目录下

## 🔧 开发命令

### 代码检查
```bash
fvm flutter analyze
```

### 代码格式化
```bash
fvm flutter format .
```

### 测试运行
```bash
fvm flutter test
```

### 构建发布
```bash
# Android
fvm flutter build apk --release

# iOS  
fvm flutter build ios --release
```

## 📚 技术文档

### 相关资源
- [flutter_tailwind 官方文档](https://github.com/fastcode555/flutter_tailwind)
- [flutter_tailwind 使用指南](https://github.com/fastcode555/flutter_tailwind/blob/master/guide.md)
- [GetX 状态管理](https://pub.dev/packages/get)
- [Flutter 官方文档](https://flutter.dev/docs)

### 代码生成工具
- [Json2Dart_Null_Safety](https://github.com/fastcode555/Json2Dart_Null_Safety) - JSON 模型生成

## 🐛 问题排查

### 常见问题

#### 1. flutter_tailwind 样式不生效
- 确保已调用 `.mk` 方法
- 检查是否正确导入 `flutter_tailwind` 包
- 验证 ScreenUtilInit 是否正确配置

#### 2. GetX 路由不工作
- 确保使用 `GetMaterialApp` 而不是 `MaterialApp`
- 检查 Get.to() 方法调用是否正确

#### 3. 屏幕适配问题
- 确认 ScreenUtilInit 设计稿尺寸配置
- 使用 `.r` 单位进行响应式设计

## 📄 更新日志

### v1.0.0 (2024-12-19)
- ✅ 完成项目初始化和基础配置
- ✅ 集成 flutter_tailwind 和 GetX
- ✅ 完成 Auth 模块重构（登录、注册、忘记密码）
- ✅ 完成 Profile 模块重构（资料编辑）
- ✅ 完成 Feed 模块重构（动态流）
- ✅ 完成 Chat 模块重构（消息列表）
- ✅ 完成 Friends 模块重构（好友列表、用户详情）
- ✅ 完成 Notifications 模块重构（通知列表）
- ✅ 完成 Settings 模块重构（设置页面）
- ✅ 创建主页导航和功能演示
- ✅ 建立完整的项目文档

## 👥 开发团队

- **项目负责人**: Flutter Expert Team
- **技术栈**: Flutter + flutter_tailwind + GetX
- **开发时间**: 2024-12-19

## 📞 联系我们

如有问题或建议，欢迎通过以下方式联系：

- 📧 Email: flutter-expert@example.com
- 🐛 Issues: 项目 GitHub Issues 页面
- 📖 文档: 项目 Wiki 页面

---

**使用愉快！🎉**
