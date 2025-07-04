import 'package:json2dart_safe/json2dart.dart';

/// 认证响应数据模型
///
/// 用于存储和传递 Facebook App 用户认证相关的响应数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class AuthResponseModel {
  /// 认证状态码
  final int code;
  /// 响应消息
  final String message;
  /// 认证令牌（可选）
  final String? token;

  const AuthResponseModel({
    required this.code,
    required this.message,
    this.token,
  });

  /// 必须方法：fromJson - JSON反序列化
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      code: json.asInt('code'),
      message: json.asString('message'),
      token: json['token'] as String?,
    );
  }

  /// 必须方法：toJson - JSON序列化
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      if (token != null) 'token': token,
    };
  }

  /// 必须方法：copyWith - 不可变对象更新
  AuthResponseModel copyWith({
    int? code,
    String? message,
    String? token,
  }) {
    return AuthResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }
} 