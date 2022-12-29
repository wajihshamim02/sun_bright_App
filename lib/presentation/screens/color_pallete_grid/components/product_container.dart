import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sun_bright/presentation/screens/product_details/product_details_screen.dart';
import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';
import '../../../../data/models/product.dart';
import '../../cart/cart_screen.dart';
import '../../checkout/checkout_screen.dart';
// import '../../product_details/product_details_screen.dart';

class ProductDetailContainer extends StatelessWidget {
  final String? id, image, title;
  final double price;
  // final product = ModalRoute.of(context)!.settings.arguments as Product;
  // final GestureTapCallback onTap;

   ProductDetailContainer(
      {Key? key,
      this.id,
      required this.image,
      // required this.onTap,
      required this.title,
      required this.price})
      : super(key: key);

  @override
  Widget build( BuildContext context) {
    return productDetailCard( context);
  }

  Widget productDetailCard(BuildContext context) {
 
    return
        // GestureDetector(
        //   onTap: onTap,
        //   child:
        SizedBox(
      width: SizeConfig.getProportionateScreenWidth(200),
      height: SizeConfig.getProportionateScreenWidth(250),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: Container(
                width: SizeConfig.getProportionateScreenWidth(200),
                height: SizeConfig.getProportionateScreenWidth(250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [primaryShadow],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(170),
                    ),
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 4,
                    // ),
                    // if (category != null)
                    //   Text(
                    //     category!,
                    //     style: const TextStyle(
                    //       color: Color(0xff858585),
                    //       fontSize: 16,
                    //       fontFamily: "Raleway",
                    //     ),
                    //   ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\Rs. $price",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          //fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, CartScreen.routeName,),
                      child: Container(
                        alignment: Alignment.center,
                        width: SizeConfig.getProportionateScreenWidth(150),
                        height: SizeConfig.getProportionateScreenHeight(28),
                        //color: Colors.black,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87),
                        child: const Text(
                          'Add to Cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Positioned.fill(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: SizeConfig.getProportionateScreenWidth(150),
                    height: SizeConfig.getProportionateScreenHeight(110),
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        boxShadow: [primaryShadow]),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Positioned.fill(
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Positioned.fill(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '7170',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Roboto"),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
