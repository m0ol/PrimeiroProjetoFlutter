import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: widget._controladorCampoNumeroConta,
                rotulo: "Numero Conta",
                dica: "0000",
                icone: null),
            Editor(
              controlador: widget._controladorCampoValor,
              rotulo: "Banco",
              dica: "0000",
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaRecebida = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaRecebida);
    }
  }
}
