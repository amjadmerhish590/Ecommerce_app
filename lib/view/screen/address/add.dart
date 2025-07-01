import 'package:ecommercecourse/controller/address/add_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddAddressController controllerPage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
      ),
      body: Container(
          child: GetBuilder<AddAddressController>(
              builder: (controllerPage) => HandlingDataView(
                    statusRequest: controllerPage.statusRequest,
                    widget: Column(
                      children: [
                        if (controllerPage.kGooglePlex != null)
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                GoogleMap(
                                  mapType: MapType.normal,
                                  markers: controllerPage.markers.toSet(),
                                  onTap: (latLong) {
                                    controllerPage.addMarkers(latLong);
                                  },
                                  initialCameraPosition:
                                      controllerPage.kGooglePlex!,
                                  onMapCreated:
                                      (GoogleMapController controllerMap) {
                                    controllerPage.completerController!
                                        .complete(controllerMap);
                                  },
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                      child: MaterialButton(
                                    minWidth: 200,
                                    onPressed: () {
                                      controllerPage
                                          .goToPageAddDetailsAddress();
                                    },
                                    child: Text(
                                      "completion",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    color: AppColor.primaryColor,
                                    textColor: Colors.white,
                                  )),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ))),
    );
  }
}
