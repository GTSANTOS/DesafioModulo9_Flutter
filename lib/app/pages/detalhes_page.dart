import 'dart:ffi';

import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  var dados;

  Detalhes({
    Key key,
    this.dados,
  }) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  int _qtde = 1;

  void incremento() {
    setState(() {
      _qtde++;
    });
  }

  void decremento() {
    if (_qtde <= 0) {
      return;
    }
    setState(() {
      _qtde--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Selecionar Produtos"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.help),
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 20,
                            width: 20,
                            decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 20)
                              ],
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: new Border.all(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Text("Comprar")
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 20,
                            width: 20,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Text("Pagamento")
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 20,
                            width: 20,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Text("Confirmação")
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.orange,
                        height: 25,
                        width: 25,
                        child: Center(
                            child: Text(
                          '$_qtde',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.dados['nome'] + '- Botijão de 13kg'),
                    ),
                    Spacer(),
                    Text(
                      'R' +
                          new String.fromCharCodes(new Runes('\u0024')) +
                          ' ' +
                          (widget.dados['preco'] * _qtde).toStringAsFixed(2),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blueGrey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 160, right: 20),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Icon(
                                  Icons.home,
                                  size: 40,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 5),
                                    child: Text(widget.dados['nome']),
                                  ),
                                  Row(
                                    children: [
                                      Text(widget.dados['nota'].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child:
                                    Text(widget.dados['tempoMedio'] + ' min'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  height: 35,
                                  padding: EdgeInsets.fromLTRB(10, 6, 10, 8),
                                  color: Color(
                                      int.parse("0xff${widget.dados['cor']}")),
                                  child: Center(
                                    child: Text(
                                      widget.dados['tipo'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text("Botijão de 13kg"),
                                      Text(widget.dados['nome']),
                                      Text(
                                        'R' +
                                            new String.fromCharCodes(
                                                new Runes('\u0024')) +
                                            ' ' +
                                            widget.dados['preco']
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          decremento();
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            color: Colors.blueGrey.shade200,
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                                child: Text(
                                              "-",
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )),
                                          ),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Container(
                                          color: Colors.orange,
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                              child: Text(
                                            "$_qtde",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          incremento();
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            color: Colors.blueGrey.shade200,
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                                child: Text(
                                              "+",
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueGrey.shade100,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 80, bottom: 60, right: 80),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade200,
                          Colors.blue.shade800
                        ]),
                      ),
                      child: Center(
                        child: Text(
                          "Ir para o Pagamento",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
