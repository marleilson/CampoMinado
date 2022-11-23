import 'package:flutter/material.dart';
import 'package:campo_minado/Componentes/ResultadoWidget.dart';
import 'package:campo_minado/Logica/CampoMinado.dart';
import 'package:campo_minado/Componentes/CampoWidget.dart';


class CampoMinadoApp extends StatelessWidget {

  void _reiniciar(){
    print('Reiniciar');
  }

  void _abrir(CampoMinado campominado){
    print('abrir');
  }

  void _alternarMarcao(CampoMinado campominado){
    print('alternarmarcação');
  }

  @override
  Widget build(BuildContext context) {

CampoMinado campominado = CampoMinado(linha: 0, coluna: 0);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(campoMinado: campominado,
              onAbrir: _abrir,
              onAlterarMarcacao: _alternarMarcao),
        ),

      ),
    );
  }
}
