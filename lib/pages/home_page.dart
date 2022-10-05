import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_second_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_second_app/data/tarjetas.dart';
import 'package:stripe_second_app/helpers/helpers.dart';
import 'package:stripe_second_app/pages/tarjeta_page.dart';
import 'package:stripe_second_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagar"),
          actions: [
            IconButton(
                onPressed: () async {
                  /*mostrarLoading(context);
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.pop(context);*/

                  mostrarAlerta(context, "Hola", "Mundo");
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                physics: const BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (context, index) {
                  final tarjeta = tarjetas[index];

                  return GestureDetector(
                    onTap: () {
                      //seleccio
                      final pagarBloc = BlocProvider.of<PagarBloc>(context)
                          .add(OnSeleccionarTarjeta(tarjeta));
                      // Leccion 289

                      Navigator.push(
                          context, navegarFadeIn(context, TarjetaPage()));
                    },
                    child: Hero(
                      tag: tarjeta.cardNumber,
                      child: CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        cvvCode: tarjeta.cvv,
                        showBackView: false,
                        onCreditCardWidgetChange: (creditCardBrand) {},
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: TotalPayButton(),
            )
          ],
        ));
  }
}
