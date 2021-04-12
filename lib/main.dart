import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
        appBar: AppBar(
          title: Text(
            "Referencias",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        ItemTransferencia(Transferencia(100, 123)),
        ItemTransferencia(Transferencia(22, 13)),
        ItemTransferencia(Transferencia(0, 3)),
      ],
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
}
