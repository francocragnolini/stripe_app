import 'package:flutter/material.dart';

mostrarLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text("Espere"),
      content: LinearProgressIndicator(),
    ),
  );
}

mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              )
            ],
          ));
}
