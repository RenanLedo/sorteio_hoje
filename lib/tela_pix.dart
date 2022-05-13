import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class TelaPix extends StatefulWidget {
  const TelaPix({Key? key}) : super(key: key);

  @override
  _TelaPixState createState() => _TelaPixState();
}

class _TelaPixState extends State<TelaPix> {
  @override
  Widget build(BuildContext context) {
    final chavePix = 'pix@ledotec.com.br';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: const Text('Ajude-nos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Aqui está nossa chave PIX, basta copiar e fazer uma transferencia para nós, qualquer valor já nos ajuda a continuar com o nosso trabalho.',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              chavePix,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                style: ButtonStyle(alignment: Alignment.center),
                onPressed: () {
                  FlutterClipboard.copy(chavePix).then(
                    (value) => {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text('Chave PIX copiada com sucesso')))
                    },
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copiar Chave')),
            Spacer(),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
