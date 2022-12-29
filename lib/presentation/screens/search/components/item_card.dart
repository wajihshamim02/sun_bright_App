import 'package:flutter/material.dart';

import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';

class ItemCard extends StatelessWidget {
  final String? image, title, price;
  final GestureTapCallback onTap;
  final bool evenItem;

  const ItemCard(
      {Key? key,
      required this.image,
      required this.onTap,
      required this.title,
      required this.price,
      required this.evenItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return productCard();
  }

  Widget productCard() {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: (evenItem) ? 0 : 45),
        child: SizedBox(
          width: SizeConfig.getProportionateScreenWidth(150),
          height: SizeConfig.getProportionateScreenHeight(250),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: SizeConfig.getProportionateScreenWidth(150),
                      height: SizeConfig.getProportionateScreenHeight(200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [primaryShadow],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  SizeConfig.getProportionateScreenHeight(90),
                            ),
                            Text(
                              title!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,

                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height:
                                  SizeConfig.getProportionateScreenHeight(10),
                            ),
                            Text(
                              "\$ $price",
                              style: const TextStyle(
                                color: Color(0xff5956e9),
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              // ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: SizeConfig.getProportionateScreenWidth(100),
                      height: SizeConfig.getProportionateScreenHeight(100),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          boxShadow: [primaryShadow]),
                      child: Image.asset(
                        image!,
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
