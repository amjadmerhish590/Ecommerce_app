import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeContrllerImp> {
  const ListItemsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeContrllerImp> {
  final ItemsModel itemsModel;

  const ItemsHome({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLink.imageitems}/${itemsModel.itemsImage}",
              height: 140,
              width: 200,
              // fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 160,
            width: 250,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ))
        ],
      ),
    );
  }
}
