import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                // CustomAppBar(
                //   titleAppBar: "Find Product",
                //   onPressedSearch: () {},
                //   onPressedIconFavorite: () {
                //     Get.toNamed(AppRoute.myFavorite);
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                            myFavoriteModel: controller.data[index]);
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
