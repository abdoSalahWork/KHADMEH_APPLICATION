class EndPoints {
  static const String _baseURL = "https://wazzfny.online/api";
  static const String _adminBaseURL = "https://wazzfny.online/admin";

  static String get loginGoogle => "$_baseURL/login/google";
  static String get loginFacebook => "$_baseURL/login/facebook";
  static String get login => "$_baseURL/login";
  static String get me => "$_baseURL/me";
  static String get getAllCompanyAdvertisments => "$_baseURL/advertisments";
  static String showCompanyAdvertisment(int id) =>
      "$_baseURL/advertisment/show/$id";
  static String updateCompanyAdvertisment(int id) =>
      "$_baseURL/advertisment/update/$id";
  static String get storeCompanyAdvertisment => "$_baseURL/advertisment/store";
  static String get getAllUserEmployees => "$_baseURL/employees";
  static String showEmployee(int id) => "$_baseURL/employee/show/$id";
  static String updateEmployee(int id) => "$_baseURL/employee/update/$id";
  static String deleteEmployee(int id) => "$_baseURL/employee/delete/$id";
  static String get storeEmployee => "$_baseURL/employee/store";
  static String get registerUser => "$_baseURL/register/user";
  static String get completeDataUser => "$_baseURL/user/data";
  static String get completeDataCompany => "$_baseURL/company/data";
  static String get registerCompany => "$_baseURL/register/company";
  static String get forgetPassword => "$_baseURL/forget-password";
  static String get notifications => "$_baseURL/notifications";
  static String get confirmEmail => "$_baseURL/confirm-code-email";
  static String get resetPassword => "$_baseURL/reset-password";

///////////////////////////admin///////////////////////////
  static String get getAllCountries => "$_adminBaseURL/countries";
  static String get storeCountry => "$_adminBaseURL/country/store";
  static String updateCountry(int id) => "$_adminBaseURL/country/update/$id";
  static String deleteCountry(int id) => "$_adminBaseURL/country/delete/$id";
  static String get getAllCities => "$_adminBaseURL/cities";
  static String get storeCity => "$_adminBaseURL/city/store";
  static String updateCity(int id) => "$_adminBaseURL/city/update/$id";
  static String deleteCity(int id) => "$_adminBaseURL/city/delete/$id";
  static String get getAllRegions => "$_adminBaseURL/regions";
  static String get storeRegion => "$_adminBaseURL/region/store";
  static String updateRegion(int id) => "$_adminBaseURL/region/update/$id";
  static String deleteRegion(int id) => "$_adminBaseURL/region/delete/$id";
  static String get getAllJobs => "$_adminBaseURL/jobs";
  static String get storeJob => "$_adminBaseURL/job/store";
  static String updateJob(int id) => "$_adminBaseURL/job/update/$id";
  static String deleteJob(int id) => "$_adminBaseURL/job/delete/$id";
  static String get getAllCategories => "$_adminBaseURL/categories";
  static String get storeCategory => "$_adminBaseURL/category/store";
  static String updateCategory(int id) => "$_adminBaseURL/category/update/$id";
  static String deleteCategory(int id) => "$_adminBaseURL/category/delete/$id";
  static String get getAllCommunityTypes => "$_adminBaseURL/companyTypes";
  static String get storeCompanyType => "$_adminBaseURL/companyType/store";
  static String updateCompanyType(int id) =>
      "$_adminBaseURL/companyType/update/$id";
  static String deleteCompanyType(int id) =>
      "$_adminBaseURL/companyType/delete/$id";
  static String get getAllLanguages => "$_adminBaseURL/languages";
  static String get getAllCertificate => "$_adminBaseURL/certifications";
  static String get getAllMaritalStatus => "$_adminBaseURL/marital_status";
  static String get getAllComplexions => "$_adminBaseURL/complexions";
  static String get getAllRelegions => "$_adminBaseURL/religions";
  static String get storeLanguage => "$_adminBaseURL/language/store";
  static String updateLanguage(int id) => "$_adminBaseURL/language/update/$id";
  static String deleteLanguage(int id) => "$_adminBaseURL/language/delete/$id";
}
