import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class VerifycodeSignUpData {
  Crud crud;
  VerifycodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.reSend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
