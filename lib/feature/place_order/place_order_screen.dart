import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/consts/colors.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_button_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_appbar_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_text_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/header.dart';
import 'package:open_fashion_premium_app/feature/place_order/widgets/custom_container_widget.dart';
import 'package:open_fashion_premium_app/feature/place_order/widgets/shipping_method_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String description;
  final int quantity;
  final int total;

  const PlaceOrderScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.total,
  });

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Checkout"),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Shipping Address".toUpperCase(),
                      color: Colors.black38,
                      max: 2,
                      size: 16,
                    ),
              Gap(13),

              /// address Info
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _savedAddress != null
                        ? AddressInfo(
                            savedAddress: _savedAddress,
                            onTap: _editAddress,
                          )
                        : SizedBox.shrink(),
                    Gap(20),
                    _savedAddress == null
                        ? GestureDetector(
                            onTap: () {
                              _openAddress(context);
                            },
                            child: CustomContainerWidget(
                              text: "Add shipping address",
                              icon: Icons.add,
                              isFree: false,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              Gap(10),

              /// Shipping Method
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : ShippingMethodWidget(),

              /// payment Method
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Payment Method".toUpperCase(),
                      color: Colors.black38,
                      size: 16,
                    ),

              Gap(20),
              _savedCard != null
                  ? Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/Mastercard.svg",
                              width: 40,
                            ),
                            Gap(10),
                            CustomText(
                              text: "Master Card ending",
                              color: Colors.black,
                            ),
                            Gap(10),
                            CustomText(
                              text:
                                  "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                              color: Colors.black,
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/svgs/arrow.svg"),
                          ],
                        ),
                        Gap(20),
                        Divider(color: Colors.grey.shade300),
                      ],
                    )
                  : GestureDetector(
                      onTap: _openCard,
                      child: selectedQuantity(
                        "Select Payment Method",
                        Icons.keyboard_arrow_down_sharp,
                        false,
                      ),
                    ),

              Gap(20),

              _savedCard != null && _savedAddress != null
                  ? CartWidget(
                      image: widget.image,
                      name: widget.name,
                      description: widget.description,
                      price: widget.price,
                      quantity: widget.quantity,
                      onChanged: (quantity) =>
                          setState(() => selectedQuantity = quantity),
                    )
                  : SizedBox.shrink(),

              Gap(80),

              /// Ending
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Total", color: AppColors.primary),
                  CustomText(
                    text: "\$ ${widget.price * selectedQuantity}",
                    color: Colors.red.shade200,
                  ),
                ],
              ),
              Gap(20),
              CustomButtonWidget(
                isSvgg: true,
                title: "Place order",
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(child: CustomDailog());
                    },
                  );
                },
              ),
              Gap(70),
            ],
          ),
        ),
      ),
    );
  }
}
