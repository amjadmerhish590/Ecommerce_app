import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeContrllerImp> {
  const ListCategoriesHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 12,
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

class Categories extends GetView<HomeContrllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
