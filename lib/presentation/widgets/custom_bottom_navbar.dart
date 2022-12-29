// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sun_bright/constants/colors.dart';
// import 'package:sun_bright/constants/enums.dart';
// import 'package:sun_bright/presentation/screens/cart/cart_screen.dart';
// import 'package:sun_bright/presentation/screens/favourite/favourite_screen.dart';

// import '../bloc/cart/cart_bloc.dart';
// import '../bloc/cart/cart_event.dart';
// import '../screens/home/home_screen.dart';
// import '../screens/profile/profile_screen.dart';
// import 'custom_page_transition.dart';

// class CustomButtomNavBar extends StatelessWidget {
//   final MenuState selectedMenu;
//   const CustomButtomNavBar({Key? key, required this.selectedMenu})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       color: Colors.transparent,
//       child: SafeArea(
//         top: false,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home_sharp,
//                   color: MenuState.home == selectedMenu
//                       ? primaryColor
//                       : secondaryColor),
//               onPressed: () {
//                 // Navigator.pushNamed(context, HomeScreen.routeName);
//                 Navigator.push(
//                     context,
//                     CustomScaleTransition(
//                         nextPageUrl: HomeScreen.routeName,
//                         nextPage: const HomeScreen()));
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.favorite_outline_sharp,
//                   color: MenuState.favourite == selectedMenu
//                       ? primaryColor
//                       : inActiveIconColor),
//               onPressed: () => Navigator.push(
//                   context,
//                   CustomScaleTransition(
//                       nextPageUrl: FavouriteScreen.routeName,
//                       nextPage: const FavouriteScreen())),
//             ),
//             IconButton(
//                 icon: Icon(
//                   Icons.supervised_user_circle_outlined,
//                   color: MenuState.profile == selectedMenu
//                       ? primaryColor
//                       : inActiveIconColor,
//                 ),
//                 onPressed: () => Navigator.push(
//                     context,
//                     CustomScaleTransition(
//                         nextPageUrl: ProfileScreen.routeName,
//                         nextPage: const ProfileScreen()))),
//             IconButton(
//               icon: Icon(Icons.shopping_cart_outlined,
//                   color: MenuState.cart == selectedMenu
//                       ? primaryColor
//                       : inActiveIconColor),
//               onPressed: () {
//                 BlocProvider.of<CartBloc>(context)
//                     .add(const FetchCartProductsEvent());
//                 Navigator.push(
//                     context,
//                     CustomScaleTransition(
//                         nextPageUrl: CartScreen.routeName,
//                         nextPage: const CartScreen()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/favourite/favourite_screen.dart';
import 'package:sun_bright/presentation/screens/profile/profile_screen.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "/custom_bottom_navbar";
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<dynamic> _page = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    CartScreen(),
  ];
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    print("This is the actice page $_activePage");

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePage,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.home,
              color: _activePage == 0 ? Colors.black87 : Colors.grey,
              size: _activePage == 0 ? 40 : 30,
            ),
            Icon(
              Icons.favorite_outline,
              color: _activePage == 1 ? Colors.black87 : Colors.grey,
              size: _activePage == 1 ? 40 : 30,
            ),
            Icon(
              Icons.supervised_user_circle_outlined,
              color: _activePage == 2 ? Colors.black87 : Colors.grey,
              size: _activePage == 2 ? 40 : 30,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: _activePage == 3 ? Colors.black87 : Colors.grey,
              size: _activePage == 3 ? 40 : 30,
            ),
          ],
          color: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
            print("Index : $index active : $_activePage");
            // you don't need this as the bottom nav is doing it for you just have to specify index
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => _page[_activePage]));
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: _page[_activePage],
          ),
        ));
  }
}
