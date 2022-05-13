import 'package:flutter/material.dart';
import 'package:sorteio_hoje/tela_resultado.dart';
import 'package:timer_count_down/timer_count_down.dart';

Future<dynamic> abrirContador(BuildContext context, List<int> lista) {
  return showDialog(
      context: context,
      builder: (_) {
        return Countdown(
            seconds: 5,
            build: (BuildContext context, double time) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .7,
                  child: Card(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Estamos Sorteando...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          time.toStringAsFixed(0),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 180, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              );
            },
            interval: const Duration(seconds: 1),
            onFinished: () async {
              Navigator.of(context).pop();
              await Duration(milliseconds: 50);
              abrirDiaolgo(context, lista);
            });
      });
}
