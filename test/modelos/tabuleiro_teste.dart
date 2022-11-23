import 'package:flutter_test/flutter_test.dart';
import 'package:campo_minado/Logica/Tabuleiro.dart';

main(){

  test('Ganhando o jogo', () {

  Tabuleiro tabuleiro = Tabuleiro(
    //estabelecendo linhas, colunas e quantidades de bombas
    linhas: 2,
    colunas: 2,
    qtdeBombas: 0,

  );
    /*
    minando as colunas e bombas. Como foi determinada 2 linhas e 2 colunas, teremos 4 campos.
    Dessa forma os campos são: 0.0, 0.1, 1.0 e 1.1. cujo indices são 0, 1, 2 e 3 respectivamente.
    Logo passamos o indice para indicar os campos [0] [1]     [0.0] [0.1]
                                                  [2] [3]  ou [1.0] [1.1]
     */
    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    //Jogando
    tabuleiro.campos[0].alternarMarcacao();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();
    tabuleiro.campos[3].alternarMarcacao();

    expect(tabuleiro.resolvido, isTrue);
});

}
