import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';
import '../models/campo.dart';

class CampoWidget extends StatelessWidget {

  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcaco;

  CampoWidget({
    this.campo,
    this.onAbrir,
    this.onAlternarMarcaco,
  });

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhanca;
    if(campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if(campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if(campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcaco(campo),
      child: _getImage(),
    );
  }
}