import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/productdetials/priceandcount.dart';
// import 'package:ecommercecourse/view/widget/productdetials/subitemslist.dart';
import 'package:ecommercecourse/view/widget/productdetials/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: const Text(
              "Go To Cart ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const TopProductPageDetails(),
                      const SizedBox(
                        height: 180,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 169, 169, 169),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("${controller.itemsModel.itemsName!} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          color: AppColor.fourthColor,
                                      fontSize: 25
                                        )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PriceAndCountItems(
                                onAdd: () {
                                  controller.add();
                                },
                                onRemove: () {
                                  controller.remove();
                                },
                                price:
                                    "${controller.itemsModel.itemsPriceDiscount}",
                                count: "${controller.countItems}"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("${controller.itemsModel.itemsDesc!} ",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 20
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text("Color ",
                            //     style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            //           color: AppColor.fourthColor,
                            //         )),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const SubItemsList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
