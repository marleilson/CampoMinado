import 'package:campo_minado/Logica/CampoMinado.dart';
import 'package:flutter/material.dart';


class CampoWidget extends StatelessWidget {

  final CampoMinado campoMinado;

  _getImage() {
    int qtdeMinas = campoMinado.qtdeMinasNaVizinhanca;

    if(campoMinado.aberto && campoMinado.minado && campoMinado.explodido){
      return Image.asset('assets/images/bomba_0.jpeg');
    }else if(campoMinado.aberto && campoMinado.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    }else if(campoMinado.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    }else if(campoMinado.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    }else{
      return Image.asset('assets/images/fechado;jpeg');
    }

  }

  final void Function(CampoMinado) onAbrir;
  final void Function(CampoMinado) onAlterarMarcacao;

  CampoWidget({required this.campoMinado,
    required this.onAbrir,
    required this.onAlterarMarcacao});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campoMinado),
      onLongPress: () => onAlterarMarcacao(campoMinado),
      child: _getImage(),
    );
  }


}
