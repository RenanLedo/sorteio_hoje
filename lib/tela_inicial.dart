import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
  final _quantnumEC = TextEditingController();
  final _minEC = TextEditingController();
  final _maxEC = TextEditingController();

  final BannerAd myBanner = BannerAd(
    // adUnitId: 'ca-app-pub-9063270871484951/4125496930',
    adUnitId: '/6499/example/banner',
    size: AdSize.mediumRectangle,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void dispose() {
    super.dispose();
    _quantnumEC.dispose();
    _minEC.dispose();
    _maxEC.dispose();
  }

  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                          controller: _quantnumEC,
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
                                controller: _minEC,
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
                                controller: _maxEC,
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
                      if (int.parse(_quantnumEC.text) <=
                          int.parse(_maxEC.text) - int.parse(_minEC.text)) {
                        final lista = listaNumeros(int.parse(_quantnumEC.text),
                            min: int.parse(_minEC.text),
                            max: int.parse(_maxEC.text));
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 320,
              height: 250,
              child: AdWidget(ad: myBanner),
            )
          ],
        ),
      ),
    );
  }
}
