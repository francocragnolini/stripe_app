import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_second_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_second_app/pages/home_page.dart';
import 'package:stripe_second_app/pages/pago_completo_page.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //Stripe.publishableKey = stripePublishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PagarBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stripe App',
        theme: ThemeData.light().copyWith(
            primaryColor: Color(0xff284879),
            scaffoldBackgroundColor: Color(0xff21232A)),
        initialRoute: "home",
        routes: {
          'home': (_) => HomePage(),
          'pago_completo': (_) => PagoCompletoPage(),
        },
      ),
    );
  }
}
