import 'package:ejemplo/models/employees.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsEmployed extends StatefulWidget {
  Employess employees;
  final VoidCallback onReassemble;
  DetailsEmployed(this.employees, {this.onReassemble});

  @override
  _DetailsEmployedState createState() => _DetailsEmployedState();
}

class _DetailsEmployedState extends State<DetailsEmployed> {
  bool pressGeoON = false;
  String rodadaFecha;
  bool cmbscritta = false;

  int unirme = 0;
  @override
  void initState() {
    super.initState();
  }

  var response;
  void reassemble() {
    super.reassemble();
    if (unirme == 1) {
      setState(() {
        widget.onReassemble();
      });
    }
  }

  int colordark = 0xff4ab3f5;

  var _darkTheme = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [],
            title: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        child: Text(
                  widget.employees.name == null
                      ? "no encontrada"
                      : widget.employees.name.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                )))
              ],
            )),
        body: ListView(children: <Widget>[
          Stack(children: <Widget>[
            GestureDetector(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: 600,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new NetworkImage(
                              "https://img.icons8.com/bubbles/2x/user-male.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: new EdgeInsets.only(
                top: 50.0,
                bottom: 2,
              ),
            ),
          ]),
          Container(
            height: 38,
            child: Card(
              elevation: 15,
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Nombre : ",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color(colordark)),
                    ),
                  ),
                  new Flexible(
                    child: Container(
                      child: Text(
                        widget.employees.name == null
                            ? ""
                            : widget.employees.name,
                        overflow: TextOverflow.fade,
                        style: new TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Cargo : ",
                        style: TextStyle(
                          color: Color(colordark),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Expanded(
                      child: Container(
                          child: Text(
                    widget.employees.position,
                    overflow: TextOverflow.fade,
                  ))),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Salario : ",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color(colordark)),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          child: Text(widget.employees.wage.toString(),
                              overflow: TextOverflow.fade))),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 8,
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(left: 20),
                  //     child: Text(
                  //       "Modalidad: ",
                  //       style: TextStyle(
                  //         color: Color(colordark),
                  //         fontSize: 15.0,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     )),
                  // Container(child: Text(widget.rodada.modalidad.toString()))
                ],
              ),
              Container(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 20,
                  ),
                  Container(
                    width: 5,
                  ),
                  Text(widget.employees.id.toString(),
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Colors.green, letterSpacing: 0.2)),
                  Container(
                    width: 10,
                  ),
                  // Icon(
                  //   Icons.comment,
                  //   size: 20,
                  // ),
                  // Container(
                  //   width: 5,
                  // ),
                  /*  Text(rodada.comentarios.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green, letterSpacing: 0.2)),*/
                ],
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 10,
          ),
        ]));
  }
}
