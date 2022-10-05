import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_second_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_second_app/widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tarjeta = BlocProvider.of<PagarBloc>(context).state.tarjeta;
    return Scaffold(
        appBar: AppBar(
          //Leccion 288-289
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              //TODO: OnDesactivarTarjeta.
              BlocProvider.of<PagarBloc>(context).add(OnDesactivarTarjeta());
              Navigator.pop(context);
            },
          ),
          //Leccion 288-289
          title: const Text("Pagar"),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: tarjeta!.cardNumber,
              child: CreditCardWidget(
                cardNumber: tarjeta.cardNumberHidden,
                expiryDate: tarjeta.expiracyDate,
                cardHolderName: tarjeta.cardHolderName,
                cvvCode: tarjeta.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (creditCardBrand) {},
              ),
            ),
            const Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
