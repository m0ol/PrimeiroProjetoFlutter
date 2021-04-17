import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    BytebankApp(),
  );
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: "Numero Conta",
              dica: "0000",
              icone: null),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: "Banco",
            dica: "0000",
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Clicou no confirmar');
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: Icon(icone),
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Referencias",
        ),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100, 123)),
          ItemTransferencia(Transferencia(22, 13)),
          ItemTransferencia(Transferencia(0, 3)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.banco.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double banco;
  final int conta;

  const Transferencia(this.banco, this.conta);

  String toString() {
    return 'Transferencia`{valor: $banco, numerocont:$conta';
  }
}
