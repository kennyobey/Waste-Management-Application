import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halal_design/di/api_link.dart';
import 'package:halal_design/di/shared_pref.dart';
import 'package:halal_design/models/collector_list.dart';
import 'package:halal_design/models/collector_model.dart';
import 'package:halal_design/models/container_model.dart';
import 'package:halal_design/models/sign_in_model.dart';
import 'package:halal_design/models/teams_list.dart';
import 'package:halal_design/screens/ui/auth_screen/otp_screen.dart';
import 'package:halal_design/screens/ui/auth_screen/sign_in.dart';
import 'package:halal_design/screens/ui/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

enum GetColletorStatus { empty, loading, error, success, available }

enum GetTeamStatus { empty, loading, error, success, available }

enum GetContainerStatus { empty, loading, error, success, available }

enum CreateColletorStatus {
  empty,
  loading,
  error,
  success,
}

enum AssignTeamToContainerStatus {
  empty,
  loading,
  error,
  success,
}

enum AddColletorStatus {
  empty,
  loading,
  error,
  success,
}

enum CreateContainerStatus {
  empty,
  loading,
  error,
  success,
}

enum UpdateContainerStatus {
  empty,
  loading,
  error,
  success,
}

enum UpdateTeamStatus {
  empty,
  loading,
  error,
  success,
}

enum DeleteContainerStatus {
  empty,
  loading,
  error,
  success,
}

enum DeleteTeamsStatus {
  empty,
  loading,
  error,
  success,
}

enum CreateTeamStatus {
  empty,
  loading,
  error,
  success,
}

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

class AuthRepo extends GetxController {
  late final accountTypeController = TextEditingController();
  late final fNameController = TextEditingController();
  late final lNameController = TextEditingController();
  late final userNameController = TextEditingController();
  late final emailController = TextEditingController(text: 'MallamTYU');
  late final phoneNoController = TextEditingController();
  late final passwordController = TextEditingController(text: 'Postman1.');
  late final confirmPasswordController = TextEditingController();
  late final addressController = TextEditingController();
  late final otpPin = TextEditingController();
  late final userIdController = TextEditingController();
// collector controller.
  late final collectorEmailController = TextEditingController();
  late final collectorFirstNameController = TextEditingController();
  late final collectorLastNameController = TextEditingController();
  late final collectorPhoneNumController = TextEditingController();
  late final collectorAdressController = TextEditingController();
  // create container
  late final containerLocationController = TextEditingController();
  late final containerTeamController = TextEditingController();
  late final containerVolumeController = TextEditingController();

  // create teams
  late final teamNameController = TextEditingController();
  late final teamAreaController = TextEditingController();

  final Rx<List<Result>> _getColletorList = Rx([]);
  List<Result> get getColletorList => _getColletorList.value;

  final Rx<List<TeamResult>> _getTeamsList = Rx([]);
  List<TeamResult> get getTeamsList => _getTeamsList.value;

  final Rx<List<ContaineDataModel>> _getContainerList = Rx([]);
  List<ContaineDataModel> get getContainerList => _getContainerList.value;

  final _authStatus = AuthStatus.empty.obs;
  final status = AuthStatus.uninitialized.obs;
  final _signInStatus = SignInStatus.empty.obs;
  final _signUpStatus = SignUpStatus.empty.obs;
  final _otpAuthStatus = OtpAuthStatus.empty.obs;
  final _otpValidateStatus = OtpValidateStatus.empty.obs;
  final _updateProfileStatus = UpdateProfileStatus.empty.obs;
  final _otpForgotVerifyStatus = OtpForgotVerifyStatus.empty.obs;
  final _createColletorStatus = CreateColletorStatus.empty.obs;
  final _createContainerStatus = CreateContainerStatus.empty.obs;
  final _deleteContainerStatus = DeleteContainerStatus.empty.obs;
  final _createTeamsStatus = CreateTeamStatus.empty.obs;
  final _getColletorStatus = GetColletorStatus.empty.obs;
  final _getTeamsStatus = GetTeamStatus.empty.obs;
  final _deleteTeamsStatus = DeleteTeamsStatus.empty.obs;
  final _getContainerStatus = GetContainerStatus.empty.obs;
  final _updateContainerStatus = UpdateContainerStatus.empty.obs;
  final _updateTeamStatus = UpdateTeamStatus.empty.obs;
  final _addColletorStatus = AddColletorStatus.empty.obs;
  final _assignTeamToContainerStatus = AssignTeamToContainerStatus.empty.obs;

  AuthStatus get authStatus => _authStatus.value;
  SignUpStatus get signUpStatus => _signUpStatus.value;
  SignInStatus get signInStatus => _signInStatus.value;
  OtpAuthStatus get otpAuthStatus => _otpAuthStatus.value;
  OtpValidateStatus get otpValidateStatus => _otpValidateStatus.value;
  UpdateProfileStatus get updateProfileStatus => _updateProfileStatus.value;
  OtpForgotVerifyStatus get otpForgotVerifyStatus =>
      _otpForgotVerifyStatus.value;
  CreateColletorStatus get createColletorStatus => _createColletorStatus.value;
  CreateTeamStatus get createTeamsStatus => _createTeamsStatus.value;
  CreateContainerStatus get createContainerStatus =>
      _createContainerStatus.value;
  GetColletorStatus get getColletorStatus => _getColletorStatus.value;
  GetTeamStatus get getTeamsStatus => _getTeamsStatus.value;
  GetContainerStatus get getContainerStatus => _getContainerStatus.value;
  UpdateContainerStatus get updateContainerStatus =>
      _updateContainerStatus.value;
  DeleteContainerStatus get deleteContainerStatus =>
      _deleteContainerStatus.value;
  DeleteTeamsStatus get deleteTeamsStatus => _deleteTeamsStatus.value;
  UpdateTeamStatus get updateTeamStatus => _updateTeamStatus.value;
  AddColletorStatus get addColletorStatus => _addColletorStatus.value;
  AssignTeamToContainerStatus get assignTeamToContainerStatus =>
      _assignTeamToContainerStatus.value;

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
      print('res 1---- ${response.body}');

      if (json['status'] == 'success') {
        print('here 1');
        Get.snackbar('Success',
            'Account created successfully, Proceed to validate your account!');
        Get.off(() => OtpScreen(
              userId: json['data']['identifier'],
            ));
        // if (kDebugMode) {
        //   print('res2 ---- ${response.body}');
        //   //print("user id ${json['data']['identifier']}");
        // }
        print('here');
        return signInFromJson(response.body);
      } else if (json['status'] == 'failed') {
        // Fluttertoast.showToast(
        //   msg: "${json['message']}",
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.TOP,
        //   timeInSecForIosWeb: 2,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
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

  Future validateAccount({String? otp, userId}) async {
    _otpValidateStatus(OtpValidateStatus.loading);
    try {
      if (kDebugMode) {
        print('verifying otp...');
        print('user Id: $userId, otp: $otp');
      }

      var response = await http.post(Uri.parse(ApiLink.baseurl),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "otp": otp,
            "identifier": userId,
          }));
      if (kDebugMode) {
        print('i am here');
        print('body is ${response.body}');
      }
      print('i am here 2');
      var json = jsonDecode(response.body);
      // if (json['success'] == false) {
      //   throw (json['message']);
      // }

      if (response.statusCode == 200) {
        print('i am here 3');
        Get.snackbar(
            'Success', 'Otp validated successfully, Proceed to dashboard!');
        // Get.to(() => const SuccessPage(
        //       title: 'validate',
        //     ));
        if (kDebugMode) {
          print(' response is &{response.body}');
          print("user id ${json['data']['identifier']}");
        }
        print('here');
        // return userFromJson(response.body);
      } else if (response.statusCode == 409) {
        _otpValidateStatus(OtpValidateStatus.success);
        Get.snackbar('error', 'The email has already been taken');
        _signUpStatus(SignUpStatus.error);
      } else if (response.statusCode == 40) {
        _otpValidateStatus(OtpValidateStatus.success);
        Get.snackbar('error', 'OTP is not valid');
        _signUpStatus(SignUpStatus.error);
      } else {
        return Future.error((json.decode(response.body)['message']) ??
            'Failed to validate user');
      }

      // return response.body;
    } catch (error) {
      _otpValidateStatus(OtpValidateStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com''"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print("error ${error.toString()}");
      }
    }
  }

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

  Future login() async {
    _signInStatus(SignInStatus.loading);
    try {
      if (kDebugMode) {
        print('login here...');
      }

      var response = await http.post(
          Uri.parse(
            ApiLink.loginUser,
          ),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "login_param": emailController.text.trim(),
            "password": passwordController.text.trim(),
          }));
      if (kDebugMode) {
        print('token is $token');
        print(response.body);
      }
      print(emailController.text.trim());

      var json = jsonDecode(response.body);
      // if (json['success'] == false) {
      //   throw (json['message']);
      // }
      if (json['status'] == 'success') {
        _signInStatus(SignInStatus.success);
        mToken(json['token']);
        pref!.saveToken(token);

        if (kDebugMode) {
          print('The token is $token');
        }
        getUser();
        // Get.to(() => const Dashboard());
        _signInStatus(SignInStatus.error);
      } else if (json['status'] == 'failed') {
        _signInStatus(SignInStatus.error);
        Get.snackbar('Alert', 'Please verify your account in order to proceed');
        // Get.off(() => OtpScreen(
        //       userId: json['data']['identifier'],
        //     ));
      }
      return response.body;
    } catch (error) {
      _signInStatus(SignInStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com''"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print("error side ${error.toString()}");
      }
    }
  }

  Future getUser() async {
    if (kDebugMode) {
      print('getting user details...');
    }
    _authStatus(AuthStatus.loading);
    try {
      //  EasyLoading.show(status: 'loading...');

      var response = await http.get(
          Uri.parse(
            ApiLink.getUser,
          ),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });

      if (kDebugMode) {
        print("user data is ${response.body}");
      }
      print('here 1');
      var json = jsonDecode(response.body);
      if (json['status'] == 'success') {
        print('here 3');
        var json = jsonDecode(response.body);
        var userModel = User.fromJson(json['result']);
        pref!.setUser(userModel);
        print('here 4');
        mUser(userModel);
        if (kDebugMode) {
          print('user details is ${userModel.toJson()}');
        }
        print('here 2');
        Get.to(() => const Dashboard());
        pref!.setUser(userModel);
        _authStatus(AuthStatus.authenticated);
        //  EasyLoading.dismiss();
      }
    } catch (error) {
      _signInStatus(SignInStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com''"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print("error side ${error.toString()}");
      }
    }
  }

  Future createCollector({required imageurl}) async {
    try {
      _createColletorStatus(CreateColletorStatus.loading);

      if (kDebugMode) {
        // print('creating Collector...');
        // print('Collector json image: $imageurl');
        // print('Collector json fname: $collectorFirstNameController.text');
        // print('Collector json lname: $collectorLastNameController.text');
        // print('Collector json adress: $collectorAdressController.text');
        // print('Collector json phone: $collectorPhoneNumController.text');
      }
      var map = <String, dynamic>{};
      map['first_name'] = collectorFirstNameController.text.trim();
      map['last_name'] = collectorLastNameController.text.trim();
      map['image'] = imageurl;
      map['address'] = collectorAdressController.text.trim();
      map['phone'] = collectorPhoneNumController.text.trim();
      // var requestBody = {
      //   'first_name': collectorFirstNameController.text.trim(),
      //   'last_name': collectorLastNameController.text.trim(),
      //   'image': imageurl,
      //   'address': collectorAdressController.text.trim(),
      //   'phone': collectorPhoneNumController.text.trim(),
      // };
      var response = await http.post(
        Uri.parse(ApiLink.createCollector),
        body: map,
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/form-data",
          "Authorization": "Bearer $token"
        },
      );
      print('Collector map is: $map');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('collector response is ${response.body}');

      if (json['status'] == 'success') {
        _createColletorStatus(CreateColletorStatus.success);

        Get.snackbar('Success', 'Collector created successfully!');
        clear();
      }
      print('here');
      return collectoModelFromJson(response.body);
    } catch (error) {
      _createColletorStatus(CreateColletorStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector creation Error ${error.toString()}');
      }
    }
  }

  Future createContainer({required lat, required lon}) async {
    try {
      _createContainerStatus(CreateContainerStatus.loading);

      var requestBody = {
        'location': containerLocationController.text.trim(),
        'team': containerTeamController.text.trim(),
        'volume': containerVolumeController.text.trim(),
      };
      var response = await http.post(
        Uri.parse(ApiLink.createContainer),
        body: jsonEncode({
          'location': containerLocationController.text.trim(),
          'volume': containerVolumeController.text.trim(),
          'latitude': lat,
          'longitude': lon,
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('Collector body is: $requestBody');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('Container response is ${response.body}');

      if (json['status'] == 'success') {
        _createContainerStatus(CreateContainerStatus.success);
        Get.snackbar('Success', 'Container created successfully!');
        Get.to(() => const Dashboard());
        clear();
      }
      print('here');
      return collectoModelFromJson(response.body);
    } catch (error) {
      _createContainerStatus(CreateContainerStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector creation Error ${error.toString()}');
      }
    }
  }

  Future assignContainerToTeam({required teamName, required id}) async {
    try {
      _assignTeamToContainerStatus(AssignTeamToContainerStatus.loading);

      var response = await http.post(
        Uri.parse(ApiLink.assignContainerToTeam),
        body: jsonEncode({
          'team_name': teamName,
          'container_id': id,
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('assign team response is ${response.body}');

      if (json['status'] == 'success') {
        _assignTeamToContainerStatus(AssignTeamToContainerStatus.success);
        Get.snackbar('Success', 'Team assigned successfully!');
      }
      print('here');
    } catch (error) {
      _assignTeamToContainerStatus(AssignTeamToContainerStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector creation Error ${error.toString()}');
      }
    }
  }

  Future addCollector(
      {required collectorID, required position, required teamName}) async {
    try {
      _addColletorStatus(AddColletorStatus.loading);

      var requestBody = {
        'team_name': teamName,
        'position': position,
        'collector_id': collectorID,
      };
      var response = await http.put(
        Uri.parse(ApiLink.addCollector),
        body: jsonEncode({
          'team_name': teamName,
          'position': position,
          'collector_id': collectorID,
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('Collector body is: $requestBody');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }

      print('Add collector response is ${response.body}');

      if (json['status'] == 'success') {
        _addColletorStatus(AddColletorStatus.success);
        Fluttertoast.showToast(
          msg: "Container updated successfully!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.snackbar('Success', 'Container updated successfully!');
        Get.back();

        //Get.to(() => const Dashboard());
        clear();
      }
      Fluttertoast.showToast(
        msg: "${json['status']['message']}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      _addColletorStatus(AddColletorStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector update Error ${error.toString()}');
        Get.back();
      }
    }
  }

  Future upadateContainer({
    required containerId,
    required teamName,
  }) async {
    try {
      _updateContainerStatus(UpdateContainerStatus.loading);

      var response = await http.put(
        Uri.parse(ApiLink.updateContainer),
        body: jsonEncode({
          'container_id': containerId,
          'team': teamName,
          'volume': containerVolumeController.text.trim(),
          'location': containerLocationController.text.trim(),
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('Container response is ${response.body}');

      if (json['status'] == 'success') {
        _updateContainerStatus(UpdateContainerStatus.success);
        Get.snackbar('Success', 'Container updated successfully!');
        Get.back();
        getContainer();
        //Get.to(() => const Dashboard());
        clear();
      }
      print('here');
      return collectoModelFromJson(response.body);
    } catch (error) {
      _updateContainerStatus(UpdateContainerStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector update Error ${error.toString()}');
      }
    }
  }

  Future createTeam() async {
    try {
      _createTeamsStatus(CreateTeamStatus.loading);

      var response = await http.post(
        Uri.parse(ApiLink.createTeams),
        body: jsonEncode({
          'name': teamNameController.text.trim(),
          'area': teamAreaController.text.trim(),
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      // print('Collector body is: $requestBody');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('Teams response is ${response.body}');

      if (json['status'] == 'success') {
        _createTeamsStatus(CreateTeamStatus.success);
        Get.snackbar('Success', 'Teams created successfully!');
        Get.to(() => const Dashboard());
        clear();
      }
      print('here');
      return collectoModelFromJson(response.body);
    } catch (error) {
      _createTeamsStatus(CreateTeamStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector creation Error ${error.toString()}');
      }
    }
  }

  Future upadateTeam({required teamId}) async {
    try {
      _updateTeamStatus(UpdateTeamStatus.loading);

      var requestBody = {
        'location': containerLocationController.text.trim(),
        'team': containerTeamController.text.trim(),
        'volume': containerVolumeController.text.trim(),
      };
      var response = await http.put(
        Uri.parse(ApiLink.updateTeam),
        body: jsonEncode({
          'team_id': teamId,
          'name': teamNameController.text.trim(),
        }),
        //jsonEncode(createCollector.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('Collector body is: $requestBody');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print('token is $token');
      }
      print('Container response is ${response.body}');

      if (json['status'] == 'success') {
        _updateTeamStatus(UpdateTeamStatus.success);
        Get.snackbar('Success', 'Container updated successfully!');
        getTeams();
        Get.back();

        //Get.to(() => const Dashboard());
        clear();
      }
      print('here');
      return collectoModelFromJson(response.body);
    } catch (error) {
      _updateTeamStatus(UpdateTeamStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector update Error ${error.toString()}');
      }
    }
  }

  Future getCollector() async {
    try {
      _getColletorStatus(GetColletorStatus.loading);
      if (kDebugMode) {
        print('getting my collector...');
      }
      var response = await http.get(
        Uri.parse(ApiLink.getAllCollector),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('here 1');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body);
      }
      print('here 2');
      if (json['status'] == 'success') {
        var list = List.from(json['result']);
        var collectors = list.map((e) => Result.fromJson(e)).toList();
        if (kDebugMode) {
          print("Collector list lenght ${collectors.length} request");
          print("Req  ${collectors.first} request");
        }
        _getColletorList(collectors);
        collectors.isNotEmpty
            ? _getColletorStatus(GetColletorStatus.available)
            : _getColletorStatus(GetColletorStatus.empty);
        _getColletorStatus(GetColletorStatus.success);
      }
      return response.body;
    } catch (error) {
      _getColletorStatus(GetColletorStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('my request Error ${error.toString()}');
      }
    }
  }

  Future getTeams() async {
    try {
      _getTeamsStatus(GetTeamStatus.loading);
      if (kDebugMode) {
        print('getting my teams...');
      }
      var response = await http.get(
        Uri.parse(ApiLink.getAllTeams),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('here 1');

      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body);
      }
      print('here 2');
      if (json['status'] == 'success') {
        var list = List.from(json['result']);
        var teams = list.map((e) => TeamResult.fromJson(e)).toList();
        if (kDebugMode) {
          print("Team list lenght ${teams.length} request");
          print("Req  ${teams.first} request");
        }
        _getTeamsList(teams);
        teams.isNotEmpty
            ? _getTeamsStatus(GetTeamStatus.available)
            : _getTeamsStatus(GetTeamStatus.empty);
        _getTeamsStatus(GetTeamStatus.success);
      }
      return response.body;
    } catch (error) {
      _getTeamsStatus(GetTeamStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('my request Error ${error.toString()}');
      }
    }
  }

  Future getContainer() async {
    try {
      _getContainerStatus(GetContainerStatus.loading);
      if (kDebugMode) {
        print('getting my containers...');
      }
      var response = await http.get(
        Uri.parse(ApiLink.getContainer),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print('here 1');
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body);
      }
      print('here 2');
      if (json['status'] == 'success') {
        var list = List.from(json['result']);
        var containerList =
            list.map((e) => ContaineDataModel.fromJson(e)).toList();
        if (kDebugMode) {
          print("container list lenght ${containerList.length} request");
          print("Req  ${containerList.first} request");
        }
        _getContainerList(containerList);
        containerList.isNotEmpty
            ? _getContainerStatus(GetContainerStatus.available)
            : _getContainerStatus(GetContainerStatus.empty);
        _getContainerStatus(GetContainerStatus.success);
      }
      return response.body;
    } catch (error) {
      _getContainerStatus(GetContainerStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('my request Error ${error.toString()}');
      }
    }
  }

  Future deleteContainer({required containerId}) async {
    try {
      _deleteContainerStatus(DeleteContainerStatus.loading);
      final response = await http.delete(
        Uri.parse("${ApiLink.deleteContainer}/$containerId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var json = jsonDecode(response.body);

      if (json['status'] == 'success') {
        _deleteContainerStatus(DeleteContainerStatus.success);
        Get.snackbar('Success', 'Container deleted successfully!');
        getContainer();
        Get.to(() => const Dashboard());
      } else {
        throw Exception('Failed to delete cont');
      }
    } catch (error) {
      _deleteContainerStatus(DeleteContainerStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Collector update Error ${error.toString()}');
      }
      print(error);
    }
  }

  Future deleteTeam({required teamId}) async {
    try {
      _deleteTeamsStatus(DeleteTeamsStatus.loading);
      final response = await http.delete(
        Uri.parse("${ApiLink.deleteTeam}/$teamId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      var json = jsonDecode(response.body);

      if (json['status'] == 'success') {
        _deleteTeamsStatus(DeleteTeamsStatus.success);
        Get.snackbar('Success', 'Team deleted successfully!');
        getTeams();
        Get.to(() => const Dashboard());
      } else {
        throw Exception('Failed to delete cont');
      }
    } catch (error) {
      _deleteTeamsStatus(DeleteTeamsStatus.error);
      Get.snackbar(
          'Error',
          error.toString() ==
                  "Failed host lookup: 'smart-waste-system.herokuapp.com'"
              ? 'No internet connection!'
              : error.toString());
      if (kDebugMode) {
        print('Team Delete update Error ${error.toString()}');
      }
      print(error);
    }
  }

  void clear() {
    passwordController.clear();
    confirmPasswordController.clear();
    fNameController.clear();
    containerLocationController.clear();
    containerTeamController.clear();
    containerVolumeController.clear();
    teamNameController.clear();
    teamAreaController.clear();
  }

  void logout() {
    _authStatus(AuthStatus.unAuthenticated);
    clear();
    pref!.saveToken("0");
    mToken("0");
    pref!.logout();
    Get.offAll(() => const LoginPage());
  }
}
