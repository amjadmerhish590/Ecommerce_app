import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/offers/customitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    myController: controller.search!,
                    titleAppBar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myFavorite);
                    },
                  ),
                  SizedBox(height: 20),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  CustomListItemsOffers(
                                      itemsModel: controller.data[index])),
                        )
                      : ListItemsSearch(listDataModel: controller.listData),
                ],
              ),
            ));
  }
}
