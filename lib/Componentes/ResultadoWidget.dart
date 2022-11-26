import 'package:flutter/material.dart';
import 'package:campo_minado/Logica/CampoMinado.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function()? onReiniciar;

  const ResultadoWidget({
    required this.venceu,
    required this.onReiniciar,
    super.key,
  });

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Widget _getEmoji(){
    if (venceu == null) {
      return Image.asset('assets/images/E_Espiando.png');
    } else if (venceu!) {
      return Image.asset('assets/images/E_Feliz.png');
    } else {
      return Image.asset('assets/images/E_Triste.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          color: _getCor(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _getEmoji()
                  ),
              SizedBox(
                width: 15,
              ),
              TextButton(
                onPressed: onReiniciar,
                child: const Text('REINICIAR',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 2,
                    backgroundColor: Colors.black54,
                      color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}