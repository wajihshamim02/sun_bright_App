import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sun_bright/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:sun_bright/presentation/bloc/order/order_bloc.dart';
import 'package:sun_bright/presentation/screens/order_status/components/status_checkpoint.dart';
import 'package:sun_bright/presentation/screens/otp_screen/otp_screen.dart';
import 'package:sun_bright/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:sun_bright/presentation/screens/splash/splash_screen.dart';
import 'constants/routes.dart';
import 'presentation/bloc/cart/cart_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteBloc>(
          create: (_) => FavoriteBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        ),
        BlocProvider<OrderBloc>(
          create: (_) => OrderBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your Store',
          theme: ThemeData(fontFamily: 'Raleway'),
          initialRoute: SignInScreen.routeName,
          routes: routes),
    );
  }
}
