import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/address/add.dart';
import 'package:ecommercecourse/view/screen/address/adddetails.dart';
import 'package:ecommercecourse/view/screen/address/view.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/checkout.dart';
import 'package:ecommercecourse/view/screen/homescreen.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';
import 'package:ecommercecourse/view/screen/offers.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/orders/archive.dart';
import 'package:ecommercecourse/view/screen/orders/details.dart';
import 'package:ecommercecourse/view/screen/orders/orderstracking.dart';
import 'package:ecommercecourse/view/screen/orders/pending.dart';
import 'package:ecommercecourse/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // {/ this is root app }
  // language
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.seccessResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUP()),

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  //Address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressAddDetails, page: () => const AddressAddDetails()),

  //CheckOut
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),

  //Orders
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersTracking, page: () => const OrdersTracking()),


  //Offers
  // GetPage(name: AppRoute.offers, page: () => const OffersView()),
];
