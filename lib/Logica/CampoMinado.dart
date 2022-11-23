import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:campo_minado/Logica/explosao_exececao.dart';

class CampoMinado  {

  final int linha;
  final int coluna;
  final List<CampoMinado> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  CampoMinado({required this.linha, required this.coluna});

  void adicionarVizinho(CampoMinado vizinho){

    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if(deltaLinha == 0 && deltaColuna == 0){
      return;
    }

    if(deltaLinha <= 1 && deltaColuna <=1){
      vizinhos.add(vizinho);
    }

  }

  void abrir(){

    if(_aberto){
      return;
    }
    _aberto = true;

    if(_minado){
      _explodido = true;
      throw ExplosaoExcecao();
    }
    if(vizinhacaSegura){
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBombas(){
    if(_minado){
      _aberto = true;
    }
  }

  void minar(){
    _minado = true;
  }

  void alternarMarcacao(){
    _marcado = !_marcado;
  }

  void reiniciar(){

    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;

  }

  bool get minado{
    return _minado;
  }

  bool get explodido{
    return _explodido;
  }

  bool get aberto{
    return _aberto;
  }

  bool get marcado{
    return _marcado;
  }

  bool get resolvido{
    bool minadoEmarcado = minado && marcado;
    bool seguroEaberto = !minado && aberto;
    return minadoEmarcado || seguroEaberto;
  }

  bool get vizinhacaSegura{
    return vizinhos.every((v) => !v.minado);
  }

  int get qtdeMinasNaVizinhanca{
    return vizinhos.where((v) => v.minado).length;
  }


}