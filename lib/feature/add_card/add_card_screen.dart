import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_appbar_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/custom_button_widget.dart';
import 'package:open_fashion_premium_app/core/widgets/header.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlack: false),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Payment method"),

                /// visa card
                CreditCardWidget(
                  padding: 6,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Color(0xff505664),
                  obscureCardCvv: false,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),

                Gap(20),

                /// form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  inputConfiguration: InputConfiguration(
                    cardNumberTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardNumberDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cardHolderTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardHolderDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cvvCodeDecoration: InputDecoration(
                      hintText: "CVV",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    expiryDateTextStyle: TextStyle(fontFamily: "TenorSans"),
                    expiryDateDecoration: InputDecoration(
                      hintText: "Expiry Date",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                Gap(100),
                CustomButtonWidget(
                  isSvg: false,
                  title: "ADD CARD",
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      final data = {
                        'number': cardNumber,
                        'name': cardHolderName,
                        'date': expiryDate,
                        'cvv': cvvCode,
                      };

                      Navigator.pop(context, data);
                    }
                  },
                ),
                Gap(70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
