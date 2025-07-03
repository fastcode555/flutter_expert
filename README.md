# Facebook Flutter App

## 项目简介

本项目为 Facebook 风格的 Flutter 跨平台应用，严格遵循 [flutter_expert.mdc](.cursor/rules/flutter_expert.mdc) 规范，采用模块化结构、GetX 状态管理、Tailwind 风格 UI、Json2Dart_Null_Safety 数据模型等最佳实践，适配多端，注重性能与可维护性。

## 目录结构

```text
lib/
  main.dart
  src/
    auth/
      models/
      controllers/
      widgets/
    feed/
      models/
      controllers/
      widgets/
    chat/
      models/
      controllers/
      widgets/
    profile/
      models/
      controllers/
      widgets/
    friends/
      models/
      controllers/
      widgets/
    notifications/
      models/
      controllers/
      widgets/
    search/
      models/
      controllers/
      widgets/
  common/
  utils/
  generated/
assets/
  lottie/
test/
```

## 开发规范说明

- 状态管理统一使用 GetX
- UI 样式开发必须遵循 flutter_tailwind 及官方指南
- 数据模型/JSON 解析优先用 Json2Dart_Null_Safety
- 目录结构、注释、文档、测试、交付等全部严格遵循 .mdc 规范
- 每次新增功能或重要修改，必须在下方变更记录中登记

## 变更记录模板

| 日期       | 作者   | 模块   | 变更内容简述           |
| ---------- | ------ | ------ | ---------------------- |
| 2024-06-10 | 张三   | auth   | 新增用户数据模型       |
|            |        |        |                        |

> 详细开发规范请查阅 [.cursor/rules/flutter_expert.mdc](.cursor/rules/flutter_expert.mdc)

## 功能模块规划

本项目将实现 Facebook 主要核心功能，具体模块如下：

- **用户认证（auth）**：注册、登录、找回密码、第三方登录等
- **动态（feed）**：朋友圈/动态流、点赞、评论、转发、图片/视频发布
- **消息（chat/message）**：私信聊天、群聊、消息推送、已读未读
- **个人中心（profile）**：个人信息展示与编辑、封面、头像、资料卡
- **好友（friends）**：加好友、好友列表、分组、推荐好友、黑名单
- **通知（notifications）**：系统通知、互动提醒、消息通知
- **搜索（search）**：全局搜索、用户/动态/群组/话题等
- **公共组件（common）**：通用按钮、输入框、弹窗、加载动画等
- **资源管理（assets）**：图片、lottie动画、icon、字体等
- **设置（settings）**：账号设置、隐私设置、通知设置、语言切换
- **多语言与国际化（i18n）**：支持中英文等多语言切换
- **安全与隐私**：数据加密、权限校验、敏感信息保护
- **性能与监控**：性能优化、异常监控、埋点统计

> 所有功能开发、目录结构、注释、文档、测试、交付等均需严格遵循 .mdc 规范和本 README 规划。
