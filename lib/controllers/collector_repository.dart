

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_design/di/shared_pref.dart';
import 'package:halal_design/models/sign_in_model.dart';


// enum CreateColletorStatus {
//   empty,
//   loading,
//   error,
//   success,
// }

class CollectorRepo extends GetxController {
  late final collectorEmailController = TextEditingController();
  late final collectorFirstNameController = TextEditingController();
  late final collectorLastNameController = TextEditingController();
  late final collectorPhoneNumController = TextEditingController();
  late final collectorAdressController = TextEditingController();

  Rx<String> mToken = Rx("");
  String get token => mToken.value;
  SharedPref? pref;
  final Rx<User?> mUser = Rx(null);
  User? get user => mUser.value;
  // final _createColletorStatus = CreateColletorStatus.empty.obs;

  // CreateColletorStatus get createColletorStatus => _createColletorStatus.value;

  @override
  void onInit() async {
    super.onInit();
    pref = SharedPref();
    await pref!.init();
    if (pref!.getFirstTimeOpen()) {
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

        if (mToken.value == "0") {}
      } else {}
    }
  }

  // Future createCollector(
  //   ColletorData createCollector,
  // ) async {
  //   try {
  //     _createColletorStatus(CreateColletorStatus.loading);

  //     if (kDebugMode) {
  //       print('creating Collector...');
  //       print('Collector json: ${createCollector.toJson()}');
  //     }
  //     var response = await http.post(
  //       Uri.parse(ApiLink.createCollector),
  //       body: jsonEncode(createCollector.toJson()),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $token"
  //       },
  //     );
  //     var json = jsonDecode(response.body);
  //     if (kDebugMode) {
  //       print('token is $token');
  //     }
  //     print('collector response is ${response.body}');

  //     if (json['status'] == 'success') {
  //       _createColletorStatus(CreateColletorStatus.success);

  //       Get.snackbar('Success', 'Collector created successfully!');
  //       clear();
  //     }
  //     print('here');
  //     return collectoModelFromJson(response.body);
  //   } catch (error) {
  //     _createColletorStatus(CreateColletorStatus.error);
  //     Get.snackbar(
  //         'Error',
  //         error.toString() ==
  //                 "Failed host lookup: 'smart-waste-system.herokuapp.com'"
  //             ? 'No internet connection!'
  //             : error.toString());
  //     if (kDebugMode) {
  //       print('Collector cretion Error ${error.toString()}');
  //     }
  //   }
  // }

  void clear() {
    collectorEmailController.clear();
    collectorFirstNameController.clear();
    collectorLastNameController.clear();
    collectorPhoneNumController.clear();
    collectorAdressController.clear();
  }
}
