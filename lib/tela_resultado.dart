import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:timer_count_down/timer_count_down.dart';

Future<dynamic> abrirDiaolgo(BuildContext context, List<int> lista) {
  return showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .9,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Numeros Sorteados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: lista.length,
                      itemBuilder: (_, index) => lista.length == 1
                          ? Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    width: 500,
                                    color: Colors.orange[700],
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        lista[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 55,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            )
                          : Wrap(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                      width: 100,
                                      color: Colors.orange[700],
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          lista[index].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                )
                              ],
                            ),
                      gridDelegate: lista.length == 1
                          ? SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 500,
                              childAspectRatio: 1 / 1,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0)
                          : SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 2 / 1,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Fechar',
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green[700],
                                elevation: 0,
                              ),
                              onPressed: () {
                                Share.share(
                                    'Os resultado do sorteio foi: *${lista}*');
                              },
                              child: Text(
                                'Compartilhar no Whatsapp',
                                style: TextStyle(fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
