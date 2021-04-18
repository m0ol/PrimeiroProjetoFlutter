class Transferencia {
  final double banco;
  final int conta;

  const Transferencia(this.banco, this.conta);

  String toString() {
    return 'Transferencia`{valor: $banco, numerocont:$conta';
  }
}
