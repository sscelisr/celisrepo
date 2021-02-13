import 'package:ejemplo/models/employees.dart';
import 'package:ejemplo/provider/employees_provider.dart';
import 'package:flutter/material.dart';

import 'detailsEmployees.dart';

class ListEmployees extends StatefulWidget {
  ListEmployees({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListEmployees> {
  List<Employess> listEmployees;
  Employess employess;
  void initState() {
    listEmployees = new List();
    super.initState();
    Future.delayed(Duration.zero, () async {
      listEmployees = await EmployeesProvider().obtenerEmployesss();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list Employees"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Column(),
          ),
          Column(
            children:[ _listEmployess(listEmployees),]
          ),
          Align(
            alignment: Alignment.center,
            child: listEmployees.length == null
                ? CircularProgressIndicator()
                : Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  _listEmployess(List<Employess> employess) {
    List<Widget> listEmployees = new List();
    for (Employess employess in employess) {
      listEmployees.add(
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          child: DetailsListEmployees(employess),
        ),
      );
    }

    return listEmployees;
  }
}
