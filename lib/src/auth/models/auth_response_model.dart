/// 认证响应数据模型
///
/// 用于存储登录、注册等认证接口的响应数据。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class AuthResponseModel {
  /// 是否成功
  final bool success;
  /// 返回信息
  final String message;
  /// 用户token
  final String? token;

  AuthResponseModel({
    required this.success,
    required this.message,
    this.token,
  });
} 