import 'package:ejemplo/models/employees.dart';
import 'package:ejemplo/provider/employees_provider.dart';
import 'package:flutter/material.dart';

import 'liststyleEmployees.dart';

class ListEmployees extends StatefulWidget {
  ListEmployees({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListEmployees> {
  List<Employess> listEmployees;
  List<Employess> _filteredList = [];
  String filter = "";
  TextEditingController controller = new TextEditingController();
  Employess employess;
  void initState() {
    listEmployees = new List();
    super.initState();
    Future.delayed(Duration.zero, () async {
      listEmployees = await EmployeesProvider().obtenerEmployesss();
      setState(() {});
    });
  }

  onItemChanged(String value) {
    setState(() {
      _filteredList = listEmployees
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget appBarTitle = new Text("List of People");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    print(_filteredList);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: onItemChanged,
              controller: controller,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Column(),
          ),
          //   Expanded(
          //   child: ListView(
          //     padding: EdgeInsets.all(12.0),
          //     children: _filteredList.map((data) {
          //       return ListTile(
          //         title: Text(data.name),
          //         onTap: ()=> print(data),);
          //     }).toList(),
          //   ),
          // ),
          Column(
            children: _listEmployess(_filteredList.toList()),
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
        Center(
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: DetailsListEmployees(employess),
          ),
        ),
      );
    }

    return listEmployees;
  }
}
