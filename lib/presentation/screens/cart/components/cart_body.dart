import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_bright/data/models/cart.dart';
import 'package:sun_bright/presentation/bloc/cart/cart_bloc.dart';
import 'package:sun_bright/presentation/bloc/cart/cart_state.dart';

import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';
import '../../../bloc/cart/cart_event.dart';
import '../../../widgets/banner.dart';
import '../../../widgets/custom_page_transition.dart';
import '../../../widgets/default_button.dart';
import '../../checkout/checkout_screen.dart';
import 'cart_card.dart';
import 'no_items_found.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  late final bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (BuildContext context, CartState state) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // const CustomBanner(
              //   text: "Delivery for FREE until the end of the month",
              //   backgroundColor: Color(0xffd3f1ff),
              // ),
              // List of cart's products
              Flexible(
                flex: 3,
                child: 
                // (state is CartSuccessFetchDataState &&
                //             state.cartItems.isNotEmpty ||
                //         state is CartItemRemovedSuccessfulyState)
                    //?
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView.builder(
                          itemCount: demoCart.products.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              color: Colors.white,
                              child: Dismissible(
                                key: Key(demoCart.products[index].product.id
                                    .toString()),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  bloc.add(RemoveProductFromCartEvent(index));
                                },
                                background: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFE6E6),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: const [
                                      Spacer(),
                                      Icon(
                                        Icons.restore_from_trash,
                                        color: Colors.redAccent,
                                      )
                                    ],
                                  ),
                                ),
                                child: CartItemCard(
                                    cartItem: demoCart.products[index],
                                    itemIndex: index),
                              ),
                            ),
                          ),
                        ),
                      )
                    // : const NoItemsFound(),
              ),
              const SizedBox(
                height: 45,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: "Serif"),
                        ),
                        Text(
                          "\$421",
                          style: TextStyle(
                            color: Color(0xff5956e9),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            // letterSpacing: 1
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  DefaultButton(
                    text: "Checkout",
                    backgroundColor: primaryColor,
                    forgroundColor: Colors.white,
                    onPressed: () => Navigator.push(
                        context,
                        CustomScaleTransition(
                            nextPageUrl: CheckoutScreen.routeName,
                            nextPage: const CheckoutScreen())),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              )
            ],
          ),
        );
      },
    )
    );
  }
}
