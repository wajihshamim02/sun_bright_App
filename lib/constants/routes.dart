import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/color_pallete_grid/color_pallete_grid.dart';
import 'package:sun_bright/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:sun_bright/presentation/screens/home/components/need_a_painter.dart';
import 'package:sun_bright/presentation/screens/product_details/product_details_screen.dart';
import 'package:sun_bright/presentation/screens/profile/profile_screen.dart';
import 'package:sun_bright/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:sun_bright/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:sun_bright/presentation/widgets/custom_bottom_navbar.dart';

import '../presentation/screens/cart/cart_screen.dart';
import '../presentation/screens/checkout/checkout_screen.dart';
import '../presentation/screens/complete_profile/complete_profile.dart';
import '../presentation/screens/favourite/favourite_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/orders/orders_screen.dart';
import '../presentation/screens/otp_screen/otp_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) =>  SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  FavouriteScreen.routeName: (context) => const FavouriteScreen(),
  OrderScreen.routeName: (context) => const OrderScreen(),
  NeedAPainter.routeName: (context) => const NeedAPainter(),
  // BottomNavBar.routeName: (context) => BottomNavBar()
  // CustomBottomNavbar.routeName: (context) => const CustomBottomNavbar(),

  

  // Interior_ColorPalleteGrid.routeName: (context) => const Interior_ColorPalleteGrid(),
};
