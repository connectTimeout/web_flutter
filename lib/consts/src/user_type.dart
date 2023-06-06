class UserType {
  const UserType._();

  /// 船员用户
  static const String admin = "admin";

  /// 伙食供应商
  static const String system = "system";

  /// 备件供应商
  static const String seo = "seo";



  /// 个人用户
  ///
  /// 接口请求时请使用`userType`
  ///
  static const String user = "user";

  /// 用户类型为`user`时，接口请求使用此字段
  static String get userType => seo;
}
