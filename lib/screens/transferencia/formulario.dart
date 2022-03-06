import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloConta = 'Número da conta';
const _dicaValor = '0.00';

const _dicaNumeroConta = '0000';
const _rotuloValor = 'Valor';

const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValorConta =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: _dicaNumeroConta,
                  rotulo: _rotuloConta),
              Editor(
                  controlador: _controladorCampoValorConta,
                  dica: _dicaValor,
                  rotulo: _rotuloValor,
                  icone: Icons.monetization_on),
              ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  child: Text(_botaoConfirmar))
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valorConta =
        double.tryParse(_controladorCampoValorConta.text);
    if (numeroConta != null && valorConta != null) {
      final transferenciaCriada = Transferencia(valorConta, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
