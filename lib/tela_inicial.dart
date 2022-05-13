import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorteio_hoje/tela_contagem.dart';
import 'package:sorteio_hoje/tela_pix.dart';
import 'package:sorteio_hoje/tela_resultado.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    final quantnumEC = TextEditingController();
    final minEC = TextEditingController();
    final maxEC = TextEditingController();

    int numeroAle({required int min, required int max}) =>
        min + Random().nextInt(max - min + 1);

    List<int> listaNumeros(int quantidade,
        {required int min, required int max}) {
      final numeros = Set<int>();

      while (numeros.length < quantidade) {
        final numero = numeroAle(min: min, max: max);
        numeros.add(numero);
      }
      return List.of(numeros);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Image.asset(
                'assets/imagem/sorteiohojelogo.png',
                width: 10,
              ),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Text(
                      'Sortear',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                          controller: quantnumEC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Quantiade',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.orange),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.orangeAccent),
                                borderRadius: BorderRadius.circular(8),
                              ))),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Numeros',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const Text(
                            'Entre',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                                controller: minEC,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Mínimo',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.orange),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const Text(
                            'e',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                                controller: maxEC,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Máximo',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.orange),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (int.parse(quantnumEC.text) <=
                          int.parse(maxEC.text) - int.parse(minEC.text)) {
                        final lista = listaNumeros(int.parse(quantnumEC.text),
                            min: int.parse(minEC.text),
                            max: int.parse(maxEC.text));
                        abrirContador(context, lista);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                            content: Text(
                                'Numeros digitados são inválidos, verifique se a quantidade é menor ou igual ao intervalo de numeros sortados')));
                      }
                    },
                    child: const Text(
                      'Sortear!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Esse app foi útio para você?'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TelaPix()));
                    },
                    child: const Text('Contribuir com PIX')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
