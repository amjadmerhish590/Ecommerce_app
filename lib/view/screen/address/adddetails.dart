import 'package:ecommercecourse/controller/address/adddetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/shared/custombutton.dart';

import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details Address"),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      CustomTextFromAuth(
                          hinttext: "City",
                          labeltext: "City",
                          iconData: Icons.location_city,
                          myController: controller.city,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFromAuth(
                          hinttext: "Street",
                          labeltext: "Street",
                          iconData: Icons.streetview,
                          myController: controller.street,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFromAuth(
                          hinttext: "Name",
                          labeltext: "Name",
                          iconData: Icons.near_me,
                          myController: controller.name,
                          valid: (val) {},
                          isNumber: false),
                      CustomButton(
                        text: "Add",
                        onPressed: () {
                          controller.addAddress();
                        },
                      ),
                    ],
                  )))),
    );
  }
}
