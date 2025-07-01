import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 3.9,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[100],
                          backgroundImage: AssetImage(AppImageAsset.avatar),
                        ),
                      ),
                      Text("${controller.myServices.sharedPreferences.getString("username")}" , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.black
                      ),)
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //   // onTap: () {},
                  //   title: Text("Disable Notification"),
                  //   trailing: Switch(
                  //     onChanged: (val) {},
                  //     value: true,
                  //   ),
                  // ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersPending);
                    },
                    title: Text("Orders"),
                    trailing: Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    title: Text("Archive"),
                    trailing: Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    title: Text("Address"),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("About us"),
                    trailing: Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+963931674545"));
                    },
                    title: Text("Contact us"),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// For Contact us
// 1- Title you have 2 TextFormField , one for title and one to body and send userid
// 2- DataBase for Contact us for view to Admin 