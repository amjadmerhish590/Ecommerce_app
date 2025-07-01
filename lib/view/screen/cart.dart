import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/widget/cart/customitemscartlist.dart';
import 'package:ecommercecourse/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
                price: "${cartController.priceOrders}",
                discount: "${controller.discountCoupon}%",
                shipping: "0",
                totalPrice: "${controller.getTotalPrice()}",
                controllerCoupon: controller.controllerCoupon!,
                onApplyCoupon: () {
                  controller.checkCoupon();
                },
              )),
      body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                SizedBox(height: 10),
                TopCardCart(
                    message:
                        "You Have ${cartController.totalCountItems} Items in Your List"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        cartController.data.length,
                        (index) => CustomItemsCartList(
                          onAdd: () async {
                            await cartController.add(
                                cartController.data[index].itemsId.toString());
                            cartController.refreshPage();
                          },
                          onRemove: () async {
                            await cartController.delete(
                                cartController.data[index].itemsId.toString());
                            cartController.refreshPage();
                          },
                          imageName: "${cartController.data[index].itemsImage}",
                          name: "${cartController.data[index].itemsName}",
                          price: "${cartController.data[index].itemsprice} S.P",
                          count: "${cartController.data[index].countitems}",
                        ),
                      ),
                    ],
                  ),
                )
              ]))),
    );
  }
}
