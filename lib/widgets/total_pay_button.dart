import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_second_app/bloc/pagar/pagar_bloc.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TOTAL A PAGAR
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("250.55 USD",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),

            // BTN PAY
            //288-289
            //Todo :bloc builder
            BlocBuilder<PagarBloc, PagarState>(
              builder: (context, state) {
                return _BtnPay(state: state);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final PagarState state;

  const _BtnPay({required this.state});

  @override
  Widget build(BuildContext context) {
    return state.tarjetaActiva
        ? buildBotonTarjeta(context)
        : buildAppleAndGooglePay(context);
  }

  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      shape: const StadiumBorder(),
      minWidth: 170,
      elevation: 0,
      color: Colors.black,
      child: Row(children: [
        Icon(
          FontAwesomeIcons.solidCreditCard,
          color: Colors.white,
        ),
        Text(
          " Pagar",
          style: TextStyle(color: Colors.white, fontSize: 22),
        )
      ]),
    );
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      shape: const StadiumBorder(),
      minWidth: 150,
      elevation: 0,
      color: Colors.black,
      child: Row(children: [
        Icon(
          Platform.isAndroid ? FontAwesomeIcons.google : FontAwesomeIcons.apple,
          color: Colors.white,
        ),
        Text(
          "pay",
          style: TextStyle(color: Colors.white, fontSize: 22),
        )
      ]),
    );
  }
}
