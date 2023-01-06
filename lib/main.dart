import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sun_bright/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:sun_bright/presentation/bloc/order/order_bloc.dart';
import 'package:sun_bright/presentation/screens/home/home_screen.dart';
import 'package:sun_bright/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:sun_bright/presentation/widgets/custom_page_transition.dart';
import 'constants/routes.dart';
import 'presentation/bloc/cart/cart_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';

String? finalEmail; 


Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  Future getvalidationdata() async {

    

  }
    
  @override
  Widget build(BuildContext context) {


      // final _auth = FirebaseAuth.instance;
      // final user = _auth.currentUser;

      // if(user!=null){

      //   Navigator.push(
      //                 context,
      //                 CustomScaleTransition(
      //                     nextPageUrl: HomeScreen.routeName,
      //                     nextPage: const HomeScreen()));
      // }
      // else
      // {
      //     Navigator.push(
      //                 context,
      //                 CustomScaleTransition(
      //                     nextPageUrl: SignInScreen.routeName,
      //                     nextPage:  SignInScreen()));
      // }

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
