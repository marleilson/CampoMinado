import 'dart:math';
import 'package:campo_minado/Logica/CampoMinado.dart';

class Tabuleiro {
  //define quantas linhas, colunas e bombas o campo minado irá ter
  final int linhas;
  final int colunas;
  final int qtdeBombas;

  final List<CampoMinado> _campos = [];

  Tabuleiro(
      //exige que seja passado as quantidades
      {required this.linhas, required this.colunas, required this.qtdeBombas,
      }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }


  void reiniciar(){
    _campos.forEach((c) => c.reiniciar());
    _sortearMinas();
  }

  void revelarBombas(){
    _campos.forEach((c) => c.revelarBombas());
  }

  void _criarCampos() {
    //cria um laço for para adicionar as linhas e colunas de acordo com o valor definido
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(CampoMinado(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos(){
    for(var campo in _campos){
      for(var vizinho in _campos){
        campo.adicionarVizinho(vizinho);
      }
    }
  }
  
  void _sortearMinas(){
    int sorteadas = 0;

    if(qtdeBombas > linhas * colunas){
      return;//faz com que se a quan tidade de bombas for menor que a
      // quantidade de linhas e colunas ele não execute a função
    }
    
    while(sorteadas < qtdeBombas) {
      int i = Random().nextInt(_campos.length);
      if(!_campos[i].minado){
        sorteadas++;
        _campos[i].minar();
      }
    }
  }

  List<CampoMinado> get campos{
    return _campos;
  }

  bool get resolvido{
    return _campos.every((c) => c.resolvido);
  }
}