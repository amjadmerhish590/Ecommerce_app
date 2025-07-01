import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customcardhome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeContrllerImp controller = Get.put(HomeContrllerImp());
    return GetBuilder<HomeContrllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // if (controller.settingsData.isNotEmpty)
                            CustomCardHome(
                              title: "${controller.titleHomeCard}",
                              body: "${controller.bodyHomeCard}",
                            ),
                            CustomTitleHome(title: "Categories"),
                            ListCategoriesHome(),
                            CustomTitleHome(title: "Top Selling"),
                            ListItemsHome(),
                          ],
                        )
                      : ListItemsSearch(listDataModel: controller.listData),
                ),

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome(),
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeContrllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({Key? key, required this.listDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listDataModel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                      child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageitems}/${listDataModel[index].itemsImage}")),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listDataModel[index].itemsName!),
                        subtitle: Text(listDataModel[index].categoriesName!),
                      )),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
