import 'package:flutter/material.dart';

import 'package:sun_bright/presentation/screens/checkout/components/payment_card.dart';
import 'package:sun_bright/presentation/screens/checkout/components/shipping_card.dart';

import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/default_button.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(38)),
      child: ListView(
        children: [
          const ShippingCard(),
          const PaymentCard(),
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
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              DefaultButton(
                text: "Confirm and Pay",
                backgroundColor: primaryColor,
                forgroundColor: Colors.white,
                onPressed: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        clipBehavior: Clip.none,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Confirm and pay",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Products: 2",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xffd5d9e0),
                                    width: 1,
                                  ),
                                  color: const Color(0xfff4f6fa),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "My credit card",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Image.asset("assets/images/visa.png")
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "**** **** **** 1234",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 27,
                                            fontFamily: "Serif"),
                                      ),
                                       SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Muhammmad Wajih Shamim",
                                            style: TextStyle(
                                              color: Color(0xff858585),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "04/26",
                                            style: TextStyle(
                                              color: Color(0xff858585),
                                              fontSize: 15,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: "Serif"),
                                  ),
                                  Text(
                                    "\$400",
                                    style: TextStyle(
                                      color: Color(0xff5956e9),
                                      fontSize: 22,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              DefaultButton(
                                text: "Pay now",
                                backgroundColor: primaryColor,
                                forgroundColor: Colors.white,
                                onPressed: () => () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
