import 'package:flutter/material.dart';

import 'package:bytebank/models/transferencia.dart';

import 'package:bytebank/components/Editor.dart';

const _tituloAppBar = "Criando transferência";

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "0000";

const _textoBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                _controladorCampoNumeroConta,
                _rotuloCampoNumeroConta,
                _dicaCampoNumeroConta,
              ),
              Editor(
                _controladorCampoValor,
                _rotuloCampoValor,
                _dicaCampoValor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  _criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);

      Navigator.pop(context, transferenciaCriada);
    }
  }
}
