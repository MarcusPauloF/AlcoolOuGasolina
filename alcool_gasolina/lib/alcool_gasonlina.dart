import 'dart:ffi';

import 'package:flutter/material.dart';

class alcool_gasolina extends StatefulWidget {
  const alcool_gasolina({super.key});

  @override
  State<alcool_gasolina> createState() => _alcool_gasolinaState();
}

class _alcool_gasolinaState extends State<alcool_gasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasoliona = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasoliona.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecer seu carro.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Alcool, ex:3.20 ",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex:4.60 ",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasoliona,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
