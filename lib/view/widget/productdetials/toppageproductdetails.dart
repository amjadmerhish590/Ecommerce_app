import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 169, 169, 169),
          ),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                // height: 400,
                // width: 500,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
