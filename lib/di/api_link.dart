class ApiLink {
  static String baseurl = "https://smart-waste-system.herokuapp.com/api/v1/";

  static String signUpUser = "${baseurl}user/signup";
  // static String signUpUserDetails = "${baseurl}user/register-detail";
  static String loginUser = "${baseurl}auth/login";
  // static String loginUserDashboard = "${baseurl}user/dashboard";
  // static String validateOtp = "${baseurl}verify/validate-new-user-otp";
  // static String resendOtp = "${baseurl}verify/resend-new-user-otp";
  static String getUser = "${baseurl}user/get-single";
  // static String forgotPassword = "${baseurl}user/forgot-password";
  // static String validateResetOtp = "${baseurl}verify/password-reset-code";
  //  static String resetPassword = "${baseurl}user/create-new-password";

  //Kyc
  static String nextofkin = "${baseurl}kyc/create-update-nextofkin";

  //collector
  static String createCollector = "${baseurl}collector/register";
  static String getAllCollector = "${baseurl}collector/get-all";
  static String getAllTeams = "${baseurl}team/get-all";
  static String getContainer = "${baseurl}container/get-all";
  static String createContainer = "${baseurl}container/register";
  static String updateContainer = "${baseurl}container/update";
  static String deleteContainer = "${baseurl}container/delete";
  static String createTeams = "${baseurl}team/create";
  static String deleteTeam = "${baseurl}team/delete";
  static String updateTeam = "${baseurl}team/update";
  static String addCollector = "${baseurl}team/add";
  static String assignContainerToTeam = "${baseurl}container/assign-to-team";
}
