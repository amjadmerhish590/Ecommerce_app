import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              i: index,
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)),
                    )
                  : null,
              child: Text(
                "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.grey2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
