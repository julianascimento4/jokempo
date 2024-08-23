// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  String _imagem = "images/padrao.png";
  String _msg = "escolha sua jogada";
  List opcoes = ['pedra', 'papel', 'tesoura'];
  void _play(String opcao) {
    int i = Random().nextInt(3);
    String escolhaMaquina = opcoes[i];
    _imagem = "images/$escolhaMaquina.png";
    if ((opcao == 'papel' && escolhaMaquina == 'pedra') ||
        (opcao == 'tesoura' && escolhaMaquina == 'papel') ||
        (opcao == 'pedra' && escolhaMaquina == 'tesoura')) {
      setState(() {
        _msg = "você ganhou! :D";
      });
      ;
    } else if ((opcao == 'papel' && escolhaMaquina == 'tesoura') ||
        (opcao == 'tesoura' && escolhaMaquina == 'pedra') ||
        (opcao == 'pedra' && escolhaMaquina == 'papel')) {
      setState(() {
        _msg = "você perdeu! :(";
      });
    } else {
      setState(() {
        _msg = "empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoKenPo',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                "Jogada da Maquina",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              _imagem,
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                _msg,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play('pedra'),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play('papel'),
                  child: Image.asset(
                    "images/papel.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play('tesoura'),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 80,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
