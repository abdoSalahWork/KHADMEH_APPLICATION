class EndPoints {
  static const String _baseURL = "https://wazzfny.online/api";
  static const String _adminBaseURL = "https://wazzfny.online/admin";

  static String get loginGoogle => "$_baseURL/login/google";
  static String get loginFacebook => "$_baseURL/login/facebook";
  static String get login => "$_baseURL/login";
  static String get registerUser => "$_baseURL/register/user";
  static String get registerCompany => "$_baseURL/register/company";
  static String get forgetPassword => "$_baseURL/forget-password";
  static String get confirmEmail => "$_baseURL/confirm-code-email";
  static String get resitPassword => "$_baseURL/reset-password";
  static String get getAllCountries => "$_adminBaseURL/countries";
  static String get getAllCities => "$_adminBaseURL/cities";
  static String get getAllRegions => "$_adminBaseURL/regions";
}
