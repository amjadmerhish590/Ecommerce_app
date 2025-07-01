import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            margin: EdgeInsets.only(right: 10),
            width: 90,
            height: 60,
            decoration: BoxDecoration(
              color: controller.subItems[index]["active"] == "1"
                  ? AppColor.fourthColor
                  : Colors.white,
              border: Border.all(color: AppColor.fourthColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              controller.subItems[index]["name"],
              style: TextStyle(
                  color: controller.subItems[index]["active"] == "1"
                      ? Colors.white
                      : AppColor.fourthColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
