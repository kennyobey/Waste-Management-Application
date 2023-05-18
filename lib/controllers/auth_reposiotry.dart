import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halal_design/di/api_link.dart';
import 'package:halal_design/di/shared_pref.dart';
import 'package:halal_design/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

enum SignUpStatus {
  empty,
  loading,
  error,
  success,
}

enum OtpAuthStatus {
  empty,
  loading,
  error,
  success,
}

enum OtpForgotVerifyStatus {
  empty,
  loading,
  error,
  success,
}

enum OtpValidateStatus {
  empty,
  loading,
  error,
  success,
}

enum UpdateProfileStatus {
  empty,
  loading,
  error,
  success,
}

enum SignInStatus {
  empty,
  loading,
  error,
  success,
  invalidPinOrPhoneNumber,
}

enum AuthStatus {
  loading,
  authenticated,
  success,
  uninitialized,
  unAuthenticated,
  error,
  unknownError,
  empty,
  isFirstTime,
  phoneExist,
  emailExist,
  usernameExist,
  tokenExist,
  signedUp,
  validated,
}

class AuthRepository extends GetxController {
  late final accountTypeController = TextEditingController();
  late final fNameController = TextEditingController();
  late final lNameController = TextEditingController();
  late final emailController = TextEditingController();
  late final phoneNoController = TextEditingController();
  late final passwordController = TextEditingController();
  late final confirmPasswordController = TextEditingController();
  late final otpPin = TextEditingController();
  late final userIdController = TextEditingController();

  final _authStatus = AuthStatus.empty.obs;
  final _signInStatus = SignInStatus.empty.obs;
  final _signUpStatus = SignUpStatus.empty.obs;
  final _otpAuthStatus = OtpAuthStatus.empty.obs;
  final _otpValidateStatus = OtpValidateStatus.empty.obs;
  final _updateProfileStatus = UpdateProfileStatus.empty.obs;
  final _otpForgotVerifyStatus = OtpForgotVerifyStatus.empty.obs;

  AuthStatus get authStatus => _authStatus.value;
  SignUpStatus get signUpStatus => _signUpStatus.value;
  SignInStatus get signInStatus => _signInStatus.value;
  OtpAuthStatus get otpAuthStatus => _otpAuthStatus.value;
  OtpValidateStatus get otpValidateStatus => _otpValidateStatus.value;
  UpdateProfileStatus get updateProfileStatus => _updateProfileStatus.value;
  OtpForgotVerifyStatus get otpForgotVerifyStatus =>
      _otpForgotVerifyStatus.value;
  final status = AuthStatus.uninitialized.obs;

  // User? user;
  final Rx<User?> mUser = Rx(null);
  User? get user => mUser.value;
  SharedPref? pref;
  final Rx<String> accountType = Rx("");
  String get _accountType => accountType.value;

  Rx<String> mToken = Rx("");
  String get token => mToken.value;

  @override
  void onInit() async {
    super.onInit();
    pref = SharedPref();
    await pref!.init();
    if (pref!.getFirstTimeOpen()) {
      _authStatus(AuthStatus.isFirstTime);
      if (kDebugMode) {
        debugPrint(authStatus.name);
        print("My first time using this app");
      }
    } else {
      if (kDebugMode) {
        print("Not my First Time Using this app");
      }

      if (pref!.getUser() != null) {
        mUser(pref!.getUser()!);
        mToken(pref!.read());
        if (kDebugMode) {
          print("result of token is ${mToken.value}");
        }
        _authStatus(AuthStatus.authenticated);

        if (mToken.value == "0") {
          _authStatus(AuthStatus.unAuthenticated);
        }
      } else {
        _authStatus(AuthStatus.unAuthenticated);
      }
    }
  }

  Future signUp(User user) async {
    try {
      _signUpStatus(SignUpStatus.loading);
      if (kDebugMode) {
        print('here');
      }
      if (kDebugMode) {
        print('registering user...');
        print("request json ${user.toJson()}");
      }

      var response = await http.post(Uri.parse(ApiLink.signUpUser),
          body: jsonEncode(user.toJson()),
          headers: {
            "Content-Type": "application/json",
          });
      var json = jsonDecode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        Get.snackbar('Success',
            'Account created successfully, Proceed to validate your account!');
        // Get.off(() => OtpScreen(
        //       userId: json['data']['identifier'],
        //     ));
        if (kDebugMode) {
          print(response.body);
          print("user id ${json['data']['identifier']}");
        }
        print('here');
        return signInFromJson(response.body);
      } else if (response.statusCode == 422) {
        Get.snackbar('error', 'The email has already been taken');
        _signUpStatus(SignUpStatus.error);
      } else {
        return Future.error((json.decode(response.body)['message']) ??
            'Failed to register user');
      }
    } catch (error) {
      _signUpStatus(SignUpStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com''"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print("Error occurred ${error.toString()}");
      }
    }
  }
  //1ae8e93d-b5be-4b0a-a1c9-1ac0b70bfdba
  //6d9f1e46-49bc-420a-bb90-8aafce392911

  // Future validateAccount({String? otp, userId}) async {
  //   _otpValidateStatus(OtpValidateStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('verifying otp...');
  //       print('user Id: $userId, otp: $otp');
  //     }

  //     var response = await http.post(Uri.parse(ApiLink.validateOtp),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({
  //           "otp": otp,
  //           "identifier": userId,
  //         }));
  //     if (kDebugMode) {
  //       print('i am here');
  //       print('body is${response.body}');
  //     }
  //     print('i am here 2');
  //     var json = jsonDecode(response.body);
  //     // if (json['success'] == false) {
  //     //   throw (json['message']);
  //     // }

  //     if (response.statusCode == 200) {
  //       print('i am here 3');
  //       Get.snackbar(
  //           'Success', 'Otp validated successfully, Proceed to dashboard!');
  //       Get.to(() => const SuccessPage(
  //             title: 'validate',
  //           ));
  //       if (kDebugMode) {
  //         print(' response is &{response.body}');
  //         print("user id ${json['data']['identifier']}");
  //       }
  //       print('here');
  //       return userFromJson(response.body);
  //     } else if (response.statusCode == 409) {
  //       _otpValidateStatus(OtpValidateStatus.success);
  //       Get.snackbar('error', 'The email has already been taken');
  //       _signUpStatus(SignUpStatus.error);
  //     } else if (response.statusCode == 40) {
  //       _otpValidateStatus(OtpValidateStatus.success);
  //       Get.snackbar('error', 'OTP is not valid');
  //       _signUpStatus(SignUpStatus.error);
  //     } else {
  //       return Future.error((json.decode(response.body)['message']) ??
  //           'Failed to validate user');
  //     }

  //     // return response.body;
  //   } catch (error) {
  //     _otpValidateStatus(OtpValidateStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error ${error.toString()}");
  //     }
  //   }
  // }

  // Future resendOTP({
  //   String? id,
  // }) async {
  //   _otpAuthStatus(OtpAuthStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('resending otp...');
  //     }

  //     var response = await http.post(Uri.parse(ApiLink.resendOtp),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({"identifier": id}));
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     var json = jsonDecode(response.body);
  //     // if (json['success'] == false) {
  //     //   throw (json['message']);
  //     // }

  //     if (response.statusCode == 200) {
  //       _otpAuthStatus(OtpAuthStatus.success);
  //       if (kDebugMode) {
  //         print('Verify Response body : ${response.body}');
  //       }
  //       Get.snackbar('Success', 'Account verification code sent successfully!');
  //     }

  //     return response.body;
  //   } catch (error) {
  //     _otpAuthStatus(OtpAuthStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error ${error.toString()}");
  //     }
  //   }
  // }

  // Future forgotResetPassword() async {
  //   _otpForgotVerifyStatus(OtpForgotVerifyStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('sending email for otp...');
  //     }

  //     var response = await http.post(Uri.parse(ApiLink.forgotPassword),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({"username": emailController.text.trim()}));
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     var json = jsonDecode(response.body);
  //     if (json['success'] == false) {
  //       throw (json['message']);
  //     }

  //     if (response.statusCode == 200) {
  //       _otpForgotVerifyStatus(OtpForgotVerifyStatus.success);
  //       Get.snackbar(
  //           'Success', 'Password reset verification code sent successfully!');
  //       Get.off(() => const OtpScreen(
  //             title: 'Password',
  //           ));
  //     }

  //     return response.body;
  //   } catch (error) {
  //     _otpForgotVerifyStatus(OtpForgotVerifyStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error ${error.toString()}");
  //     }
  //   }
  // }

  // Future validateForgotResetPassword({String? otp}) async {
  //   _otpForgotVerifyStatus(OtpForgotVerifyStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('validating reset password otp...');
  //     }

  //     var response = await http.post(Uri.parse(ApiLink.validateResetOtp),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({
  //           "code": otp,
  //         }));
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     var json = jsonDecode(response.body);
  //     if (json['success'] == false) {
  //       throw (json['message']);
  //     }

  //     if (response.statusCode == 200) {
  //       _otpForgotVerifyStatus(OtpForgotVerifyStatus.success);
  //       Get.snackbar('Success', 'Password reset validated successfully!');
  //       print("user id ${json['data']['code']}");
  //       Get.to(() => CreateNewPasswordPage(
  //             code: json['data']['code'],
  //           ));
  //     }

  //     return response.body;
  //   } catch (error) {
  //     _otpForgotVerifyStatus(OtpForgotVerifyStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error ${error.toString()}");
  //     }
  //   }
  // }

  // Future resetPassword({String? otp}) async {
  //   _otpForgotVerifyStatus(OtpForgotVerifyStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('resetting password...');
  //     }

  //     var response = await http.post(Uri.parse(ApiLink.resetPassword),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({
  //           "code": otp,
  //           "password": passwordController.text.trim(),
  //           "password_confirmation": confirmPasswordController.text.trim(),
  //         }));
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     var json = jsonDecode(response.body);
  //     if (json['success'] == false) {
  //       throw (json['message']);
  //     }

  //     if (response.statusCode == 200) {
  //       _otpForgotVerifyStatus(OtpForgotVerifyStatus.success);
  //       Get.snackbar('Success', 'Password reset successfully!');
  //       // Get.to(() => const SuccessPage(
  //       //       title: 'Password',
  //       //     ));
  //     }

  //     return response.body;
  //   } catch (error) {
  //     _otpForgotVerifyStatus(OtpForgotVerifyStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error ${error.toString()}");
  //     }
  //   }
  // }

  // Future login() async {
  //   _signInStatus(SignInStatus.loading);
  //   try {
  //     if (kDebugMode) {
  //       print('login here...');
  //     }

  //     var response = await http.post(
  //         Uri.parse(
  //          // ApiLink.loginUser,
  //         ),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode({
  //           "username": emailController.text.trim(),
  //           "password": passwordController.text.trim(),
  //         }));
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     print(emailController.text.trim());

  //     var json = jsonDecode(response.body);
  //     // if (json['success'] == false) {
  //     //   throw (json['message']);
  //     // }
  //     if (response.statusCode == 200) {
  //       _signInStatus(SignInStatus.success);
  //       mToken(json['token']);
  //       pref!.saveToken(token);
  //       print('The token is ${token}');
  //       await getUser();
  //      // Get.offAll(() => const Dashboard());
  //       _signInStatus(SignInStatus.error);
  //     } else if (response.statusCode == 403) {
  //       _signInStatus(SignInStatus.error);
  //       Get.snackbar('Alert', 'Please verify your account in order to proceed');
  //       // Get.off(() => OtpScreen(
  //       //       userId: json['data']['identifier'],
  //       //     ));
  //     }
  //     return response.body;
  //   } catch (error) {
  //     _signInStatus(SignInStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error side ${error.toString()}");
  //     }
  //   }
  // }

  // Future getUser() async {
  //   if (kDebugMode) {
  //     print('getting user details...');
  //   }
  //   _authStatus(AuthStatus.loading);
  //   try {
  //     EasyLoading.show(status: 'loading...');

  //     var response = await http.get(
  //         Uri.parse(
  //           ApiLink.getUser,
  //         ),
  //         headers: {
  //           "Content-Type": "application/json",
  //           'Authorization': 'Bearer $token'
  //         });

  //     if (kDebugMode) {
  //       print("user data is ${response.body}");
  //     }
  //     print('here 1');
  //     if (response.statusCode == 200) {
  //       print('here 3');
  //       var json = jsonDecode(response.body);
  //      // var userModel = User.fromJson(json['data']['userdetail']);
  //       print('here 4');
  //      // mUser(userModel);
  //       if (kDebugMode) {
  //      //   print('user details is $userModel');
  //       }
  //       print('here 2');
  //      // Get.offAll(() => const Dashboard());
  //      // pref!.setUser(userModel);
  //       _authStatus(AuthStatus.authenticated);
  //       EasyLoading.dismiss();
  //     }
  //   } catch (error) {
  //     _signInStatus(SignInStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com''"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print("error side ${error.toString()}");
  //     }
  //   }
  // }

  void clear() {
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void logout() {
    _authStatus(AuthStatus.unAuthenticated);
    clear();
    pref!.saveToken("0");
    mToken("0");
    pref!.logout();
    //Get.offAll(() => const LoginPage());
  }
}
