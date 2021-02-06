import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final imcResult;
  Result({this.imcResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 180,
                  width: 180,
                  child: imcResult.isNormal
                      ? Image.asset("images/tongue.png", fit: BoxFit.cover)
                      : Image.asset("images/sad.png", fit: BoxFit.cover)),
              SizedBox(height: 20),
              Text(
                "Seu IMC é ${imcResult.imc.toStringAsPrecision(3)}",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.purple[400],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                imcResult.textInfo,
                style: TextStyle(fontSize: 24, color: Colors.purple[400]),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white, size: 25),
                  textColor: Colors.white,
                  color: Colors.purple[400],
                  label: Text(
                    "Calcular novamente",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
