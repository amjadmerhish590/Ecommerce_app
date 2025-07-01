// ignore_for_file: prefer_const_constructors

import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:ecommercecourse/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;

  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart({
    Key? key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.totalPrice,
    required this.controllerCoupon,
    this.onApplyCoupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: controllerCoupon,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  hintText: "Coupon Code",
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textButton: "apply",
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ]),
                    )
                  : Container(
                      child: Text("Coupon Code : ${controller.couponName!}",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("price", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("$price S.P", style: TextStyle(fontSize: 16))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("Discount", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("$discount ", style: TextStyle(fontSize: 16))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("Shipping", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("$shipping ", style: TextStyle(fontSize: 16))),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$totalPrice S.P",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textButton: "Order",
            onPressed: () {
              controller.goToPageCheckout();
            },
          )
        ],
      ),
    );
  }
}
