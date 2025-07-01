import 'package:ecommercecourse/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Reset Password",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const CustomTextTitleAuth(
                            text: "New Password",
                          ),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                            text: "Please Enter New Password",
                          ),
                          const SizedBox(height: 20),
                          CustomTextFromAuth(
                            hinttext: "Enter Your Password",
                            iconData: Icons.lock_outlined,
                            labeltext: "Password",
                            myController: controller.password,
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 40, "password");
                            },
                            obscureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                          ),
                          CustomTextFromAuth(
                            hinttext: "Re Enter Your Password",
                            iconData: Icons.lock_outlined,
                            labeltext: "Re Password",
                            myController: controller.rePassword,
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 40, "password");
                            },
                            obscureText: controller.isShowPassword2,
                            onTapIcon: () {
                              controller.showRePassword();
                            },
                          ),
                          CustomButtonAuth(
                              text: "Save",
                              onPressed: () {
                                controller.goToSuccessResetPassword();
                              }),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
