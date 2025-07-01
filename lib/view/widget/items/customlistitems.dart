import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            AppLink.imageitems + "/" + itemsModel.itemsImage!,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      translateDatabase(
                          itemsModel.itemsNameAr, itemsModel.itemsName),
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child:
                                Icon(Icons.timer_sharp, color: AppColor.grey)),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${controller.deliveryTime} Mintue",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "sans"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            if(itemsModel.itemsDiscount != 0)
                              Text(
                                "${itemsModel.itemsPrice} S.P",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColor.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans",
                                ),
                              ),
                            Text(
                              "${itemsModel.itemsPriceDiscount} S.P",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans",
                              ),
                            ),
                          ],
                        ),
                        GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.removeFavorite(
                                    itemsModel.itemsId.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId, 1);
                                controller
                                    .addFavorite(itemsModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.saleOne, width: 40),
              ),
          ],
        ),
      ),
    );
  }
}
