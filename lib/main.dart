import 'package:flutter/material.dart';

import 'IMCmodel.dart';
import 'Result.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora de IMC",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _textInfo = "";
  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      bool isNormal = false;
      if (imc < 18.6)
        _textInfo = "Abaixo do peso";
      else if (imc >= 18.6 && imc < 24.9) {
        isNormal = true;
        _textInfo = "Peso ideal";
      } else if (imc >= 24.9 && imc < 29.9)
        _textInfo = "Levemente acima do peso";
      else if (imc >= 29.9 && imc < 34.9)
        _textInfo = "Obesidade Grau I";
      else if (imc >= 34.9 && imc < 39.9)
        _textInfo = "Obesidade Grau II";
      else if (imc >= 40) _textInfo = "Obesidade Grau III";
      var imcResult =
          IMCModel(imc: imc, textInfo: _textInfo, isNormal: isNormal);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(imcResult: imcResult)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.accessibility_new_rounded,
                  size: 180, color: Colors.purple[400]),
              Text(
                "Calcule o seu IMC",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.purple[400],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Insira o seu peso e altura",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.purple[400]),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple[400], fontSize: 24),
                controller: pesoController,
                validator: (value) {
                  if (value.isEmpty) return "Insira seu peso!";
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.purple[400]),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple[400], fontSize: 24),
                controller: alturaController,
                validator: (value) {
                  if (value.isEmpty) return "Insira sua altura!";
                },
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _calcular();
                    }
                  },
                  icon: Icon(Icons.person, color: Colors.white, size: 25),
                  textColor: Colors.white,
                  color: Colors.purple[400],
                  label: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
