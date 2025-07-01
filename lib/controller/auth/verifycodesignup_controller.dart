import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
  reSend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifycodeSignUpData verifycodeSignUpData = VerifycodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifycodeSignUpData.postData(email!, verifyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend() {
    verifycodeSignUpData.reSendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
