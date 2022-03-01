
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Transfêrencias'),),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(1000.0, 12463)),
          ItemTransferencia(Transferencia(2000.0, 23463)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget{

final Transferencia _transferencia;

 ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}

class Transferencia {

  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando transferência'),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                 fontSize: 20.0
                ),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000'
                ),
                  keyboardType: TextInputType.number,
              ),
            ),Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                 fontSize: 20.0
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'
                ),
                  keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () => ListaTransferencias(),
                child: Text(
              'Confirmar'
            ))
          ],
        ));
  }
}
