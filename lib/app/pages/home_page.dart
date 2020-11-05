import 'dart:convert';

import 'package:desafio_modulo9/app/pages/detalhes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> dados;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((value) {
      this.setState(() {
        dados = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha uma Revenda"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              icon: Icon(Icons.swap_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Melhor Avaliação")),
                  PopupMenuItem(child: Text("Mais Rápido")),
                  PopupMenuItem(child: Text("Mais Barato")),
                ];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              icon: Icon(Icons.help),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Suporte")),
                  PopupMenuItem(child: Text("Termos de Serviço")),
                ];
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Botijões de 13kg em:",
                    ),
                    Text(
                      "Av Paulista,1001",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Paulista, São Paulo, SP",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    Text(
                      "Mudar",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey.shade200,
              child: ListView.builder(
                itemCount: dados?.length ?? 0,
                itemBuilder: (_, index) {
                  return new GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detalhes(dados: dados[index]))),
                    child: Card(
                      margin: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 140,
                                padding: EdgeInsets.all(10),
                                color: Color(
                                    int.parse("0xff${dados[index]['cor']}")),
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Center(
                                    child: Text(
                                      dados[index]['tipo'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      dados[index]['nome'],
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Spacer(),
                                    !dados[index]['melhorPreco']
                                        ? Text("")
                                        : Container(
                                            padding: EdgeInsets.all(4),
                                            width: 130,
                                            color: Colors.orange,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.label,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  " Melhor Preço",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 20, 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 20, 10),
                                          child: Text('Nota'),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                dados[index]['nota'].toString(),
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
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Text('Tempo Médio'),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dados[index]['tempoMedio'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              ' mim',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Text(
                                            'Preço',
                                          ),
                                        ),
                                        Text(
                                          'R' +
                                              new String.fromCharCodes(
                                                  new Runes('\u0024')) +
                                              ' ' +
                                              '${dados[index]['preco'].toStringAsFixed(2)}'
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
