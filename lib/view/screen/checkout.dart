import 'package:ecommercecourse/controller/checkout_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommercecourse/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommercecourse/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Check Out"),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controlle) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Text(
                          "Choose Payment Method",
                          style: TextStyle(
                            color: AppColor.fourthColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0"); // 0 => card
                          },
                          child: CardPaymentMethodCheckout(
                              title: "Cash On Delivery",
                              isActive: controller.paymentMethod == "0"
                                  ? true
                                  : false),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                            onTap: () {
                              controller.choosePaymentMethod("1"); // 1 => card
                            },
                            child: CardPaymentMethodCheckout(
                                title: "Payment Cards",
                                isActive: controller.paymentMethod == "1"
                                    ? true
                                    : false)),
                        const SizedBox(height: 20),
                        Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                            color: AppColor.fourthColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("0"); // 0 => Delivery
                              },
                              child: CardDeliveryTypeCheckout(
                                  imageName: AppImageAsset.deliveryImage2,
                                  title: "Delivery",
                                  active: controller.deliveryType == "0"
                                      ? true
                                      : false),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("1"); // 1 => recive
                              },
                              child: CardDeliveryTypeCheckout(
                                imageName: AppImageAsset.drivethruImage,
                                title: "Recive",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (controller.deliveryType == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.dataAddress.isNotEmpty)
                                Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                    color: AppColor.fourthColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              if (controller.dataAddress.isEmpty)
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoute.addressAdd);
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      "Please Add Shipping Address \n Click Here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              SizedBox(height: 10),
                              ...List.generate(
                                controller.dataAddress.length,
                                (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(controller
                                        .dataAddress[index].addressId
                                        .toString());
                                  },
                                  child: CardShippingAddressCheckout(
                                      title:
                                          "${controller.dataAddress[index].addressName}",
                                      body:
                                          "${controller.dataAddress[index].addressCity} ${controller.dataAddress[index].addressStreet}",
                                      isActive: controller.addressId ==
                                              controller
                                                  .dataAddress[index].addressId
                                                  .toString()
                                          ? true
                                          : false),
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                )));
  }
}
