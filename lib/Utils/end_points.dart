class EndPoints {
  static const String _baseURL = "https://khdmah.online/api";
  static const String _adminBaseURL = "https://khdmah.online/admin";

  static String get loginGoogle => "$_baseURL/login/google";
  static String get loginFacebook => "$_baseURL/login/facebook";
  static String get login => "$_baseURL/login";
  static String get me => "$_baseURL/me";
  static String get getAllCompanyAdvertisments => "$_baseURL/advertisments";

  static String get getAllRecruitmentCompanies =>
      "$_baseURL/company/recruitment";
  static String get getAllCleaningCompanies => "$_baseURL/company/cleaning";
  static String showCompany(int id) => "$_baseURL/company/show/$id";
  static String showCompanyAdvertisment(int id) =>
      "$_baseURL/advertisment/show/$id";
  static String updateCompanyAdvertisment(int id) =>
      "$_baseURL/advertisment/update/$id";
  static String get storeReview => "$_baseURL/review/store";
  static String get storeFavourite => "$_baseURL/favourite/store";
  static String deleteFavourite(int id) => "$_baseURL/favourite/delete/$id";
  static String get storeCompanyAdvertisment => "$_baseURL/advertisment/store";
  static String get getUserHomePage => "$_baseURL/homePageUser";
  static String get getRecruitmentCompanyHomePage =>
      "$_baseURL/homePagCompanyRecruitment";
  static String get getCleanCompanyHomePage =>
      "$_baseURL/homePagCompanyCleaning";
  static String get getAllChats => "$_baseURL/chat";
  static String get storeChat => "$_baseURL/chat/store";
  static String showChat(int id) => "$_baseURL/chat/show/$id";
  static String get storeMessage => "$_baseURL/message/store";
  static String get getAllUserEmployees => "$_baseURL/employees";
  static String get getAllCompanyEmployees => "$_baseURL/company/employees";
  static String get requestMedicalExamination => "$_baseURL";
  static String get requestReservationExtension =>
      "$_baseURL/reservationExtintion/store";
  static String get getReservationExtension =>
      "$_baseURL/reservationExtintions";
  static String updateReservationExtension(int id) =>
      "$_baseURL/reservationExtintion/update/$id";
  static String showEmployee(int id) => "$_baseURL/employee/show/$id";
  static String showMyEmployee(int id) => "$_baseURL/privateEmployee/show/$id";
  static String pendingEmployee(int id) => "$_baseURL/employee/pending/$id";
  static String showCompanyEmployee(int id) =>
      "$_baseURL/company/employee/show/$id";
  static String updateEmployee(int id) => "$_baseURL/employee/update/$id";
  static String storeDocs(int id) => "$_baseURL/document/store/$id";
  static String approveDocs(int id) => "$_baseURL/document/approve/$id";
  static String showDocs(int docsId) => "$_baseURL/document/show/$docsId";
  static String get getAllCompanyServices => "$_baseURL/services";
  static String get storeCompanyService => "$_baseURL/service/store";
  static String updateCompanyService(int id) => "$_baseURL/service/update/$id";
  static String deleteCompanyService(int id) => "$_baseURL/service/delete/$id";
  static String bookEmployee(int id) => "$_baseURL/booked/employee/$id";
  static String deleteEmployee(int id) => "$_baseURL/employee/delete/$id";
  static String get storeEmployee => "$_baseURL/employee/store";
  static String get storeReservationExtintion =>
      "$_baseURL/reservationExtintion/store";
  static String get showReservationExtintion =>
      "$_baseURL/reservationExtintion/show";
  static String updateReservationExtintion(int id) =>
      "$_baseURL/reservationExtintion/update/$id";

  static String get registerUser => "$_baseURL/register/user";
  static String get updateProfileUser => "$_baseURL/update/profile/user";
  static String get updateProfileCompany => "$_baseURL/update/profile/company";
  static String get completeDataUser => "$_baseURL/user/data";
  static String get completeDataCompany => "$_baseURL/company/data";
  static String get registerCompany => "$_baseURL/register/company";
  static String get forgetPassword => "$_baseURL/forget-password";
  static String get changePassword => "$_baseURL/changePassword";
  static String get notifications => "$_baseURL/notifications";
  static String get confirmEmail => "$_baseURL/confirm-code-email";
  static String get resetPassword => "$_baseURL/reset-password";
  static String get getCart => "$_baseURL/carts";
  static String get storeCart => "$_baseURL/cart/store";
  static String deleteCart(int id) => "$_baseURL/cart/delete/$id";
  static String get updateCompanySetting => "$_baseURL/seetingCompany/store";
  static String get getCompanySettingUser => "$_baseURL/seetingCompany/show";
  static String get getCompanySetting => "$_baseURL/seetingCompany/show";
  static String companyCheckout(int id) => "$_baseURL/checkout/store/$id";
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
  static String get getAllCategories => "$_adminBaseURL/services";

  static String get storeCategory => "$_adminBaseURL/service/store";
  static String updateCategory(int id) => "$_adminBaseURL/service/update/$id";
  static String deleteCategory(int id) => "$_adminBaseURL/service/delete/$id";
  static String get getAllCommunityTypes => "$_adminBaseURL/companyTypes";
  static String get storeCompanyType => "$_adminBaseURL/companyType/store";
  static String updateCompanyType(int id) =>
      "$_adminBaseURL/companyType/update/$id";
  static String deleteCompanyType(int id) =>
      "$_adminBaseURL/companyType/delete/$id";
  static String get getAllLanguages => "$_adminBaseURL/languages";
  static String get storeLanguage => "$_adminBaseURL/language/store";
  static String updateLanguage(int id) => "$_adminBaseURL/language/update/$id";
  static String deleteLanguage(int id) => "$_adminBaseURL/language/delete/$id";
  static String get getAllCertificate => "$_adminBaseURL/certifications";

  static String get storeCertificate => "$_adminBaseURL/certification/store";
  static String updateCertificate(int id) =>
      "$_adminBaseURL/certification/update/$id";
  static String deleteCertificate(int id) =>
      "$_adminBaseURL/certification/delete/$id";
  static String get getAllMaritalStatus => "$_adminBaseURL/marital_status";

  static String get storeMaritalStatus => "$_adminBaseURL/marital_status/store";
  static String updateMaritalStatus(int id) =>
      "$_adminBaseURL/marital_status/update/$id";
  static String deleteMaritalStatus(int id) =>
      "$_adminBaseURL/marital_status/delete/$id";
  static String get getAllComplexions => "$_adminBaseURL/complexions";

  static String get storeComplexion => "$_adminBaseURL/complexion/store";
  static String updateComplexion(int id) =>
      "$_adminBaseURL/complexion/update/$id";
  static String deleteComplexion(int id) =>
      "$_adminBaseURL/complexion/delete/$id";
  static String get getAllRelegions => "$_adminBaseURL/religions";

  static String get storeReligion => "$_adminBaseURL/religion/store";
  static String updateReligion(int id) => "$_adminBaseURL/religion/update/$id";
  static String deleteReligion(int id) => "$_adminBaseURL/religion/delete/$id";
  static String get storeContact => "$_adminBaseURL/contact/store";
  static String updateContact(int id) => "$_adminBaseURL/contact/update/$id";
  static String get getContact => "$_adminBaseURL/contacts";
  static String get storeAbout => "$_adminBaseURL/about/store";
  static String updateAbout(int id) => "$_adminBaseURL/about/update/$id";
  static String get getAbout => "$_adminBaseURL/abouts";
  static String get getMessages => "$_adminBaseURL/messages";
  static String get getAdminHomePage => "$_adminBaseURL/homePage";
  static String deleteMessage(int id) => "$_adminBaseURL/message/delete/$id";
  static String get updateSettingAdmin => "$_adminBaseURL/settingAdmin/update";
  static String get getSettingAdmin => "$_adminBaseURL/settingAdmin";
  static String get getAllAdminAdvertisments => "$_adminBaseURL/advertisements";
  static String get getAllAdminUserProfiles => "$_adminBaseURL/users/profile";
  static String blockProfile(int id) => "$_adminBaseURL/block/$id";
  static String get getAllAdminCompanyProfiles =>
      "$_adminBaseURL/companies/profile";
  static String updateAdminAdvertisment(int id) =>
      "$_adminBaseURL/advertisement/update/$id";
  static String showAdminUserProfile(int id) =>
      "$_adminBaseURL/user/profile/show/$id";
  static String showAdminCompanyProfile(int id) =>
      "$_adminBaseURL/company/profile/show/$id";
  static String refundAdminAdvertisment(int id) =>
      "$_adminBaseURL/advertisement/refund/$id";
}
