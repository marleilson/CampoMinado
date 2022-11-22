import 'package:campo_minado/CampoMinado.dart';
import 'package:flutter_test/flutter_test.dart'; //import que permmite realização dos testes

//main nescessario para rodar o teste
main(){
  group('Campo', (){//nescessario para começar o teste

    //testes. inicia com "test, declara a descrição e abre uma função anonima para aplicar o teste
    test('Abrir campo COM explosão', (){
      //instaceia a class CampoMinado numa variável
      CampoMinado c = CampoMinado(linha: 0, coluna: 0);
      c.minar();
      //função expect mostra o resultado esperado
      expect(c.abrir, throwsException);
    });

    test('Abrir campo SEM explosão', (){
      CampoMinado c = CampoMinado(linha: 0, coluna: 0);
      c.abrir();
      //função expect mostra o resultado esperado
      expect(c.aberto, isTrue);
    });

    test('Adicionar NÃO vizinho', (){
      CampoMinado c1 = CampoMinado(linha: 0, coluna: 0);
      CampoMinado c2 = CampoMinado(linha: 1, coluna: 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar vizinho', (){
      CampoMinado c1 = CampoMinado(linha: 3, coluna: 3);
      CampoMinado c2 = CampoMinado(linha: 2, coluna: 3);
      CampoMinado c3 = CampoMinado(linha: 3, coluna: 2);
      CampoMinado c4 = CampoMinado(linha: 4, coluna: 3);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.vizinhos.length, 3);
    });

  });
}