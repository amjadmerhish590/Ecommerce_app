import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel myFavoriteModel;
  // final bool active;
  const CustomListFavoriteItems({
    Key? key,
    required this.myFavoriteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${myFavoriteModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        AppLink.imageitems + "/" + myFavoriteModel.itemsImage!,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  translateDatabase(
                      myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName),
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Rating 3.5",
                //       textAlign: TextAlign.center,
                //     ),
                //     Container(
                //       alignment: Alignment.bottomCenter,
                //       height: 22,
                //       child: Row(
                //         children: [
                //           ...List.generate(
                //               5,
                //               (index) => Icon(
                //                     Icons.star,
                //                     size: 15,
                //                   )),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${myFavoriteModel.itemsPrice}\$",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller
                            .deleteFromFavorite(myFavoriteModel.favoriteId!);
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
