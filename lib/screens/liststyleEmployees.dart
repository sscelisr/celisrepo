import 'package:ejemplo/models/employees.dart';
import 'package:flutter/material.dart';

import 'detailsEmployed.dart';

class DetailsListEmployees extends StatelessWidget {
  Employess _employess;
  int id;
  Function alTerminar;

  DetailsListEmployees(this._employess, {this.alTerminar, this.id});
  int colordark = 0xff4ab3f5;
  int colorligth = 0xff000000;
TextEditingController controller = new TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    //super.dispose();
  }
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: <Widget>[
      GestureDetector(
        child: SizedBox(
          height: 150,
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.only(left: 46),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      _employess.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      _employess.position.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 20,
                      ),
                      Container(
                        child: Text(
                          _employess.wage.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.supervised_user_circle,
                                  size: 20,
                                ),
                                Container(
                                  width: 8,
                                ),
                                Text(_employess.id.toString(),
                                    style: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.2)),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        onTap: () {
           Navigator.push( 
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsEmployed(_employess)),
                  );
        },
      ),
    ]);
  }
}

