// import 'package:exemplo/src/contact/add_page.dart';
// import 'package:exemplo/src/shared/widgets/ContactList.dart';
import 'package:flutter/material.dart';

import 'package:flutter_testapp_reynaldo_ale_ale/src/addcontact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  const HomePage({Key key, this.list}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
  final List list;
}

class _HomePageState extends State<HomePage> {
  // HomeBloc bloc;
  Widget appBarTitle = new Text("Contatos");
  Icon actionIcon = new Icon(Icons.search);
  Color color = Colors.indigo;
  bool searching = false;
  List _users = [];

  final _cSearch = TextEditingController();

  @override
  void initState() {
    getUsers();
    // bloc = HomeModule.to.getBloc<HomeBloc>();
    super.initState();
  }

  getUsers() async {
    http.get("https://reqres.in/api/users").then((res) {
      Map userData = json.decode(res.body);
      setState(() {
        _users = userData["data"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // bloc.getListContact();
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: color,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(
                    Icons.close,
                    color: Colors.indigo,
                  );
                  this.color = Colors.white;
                  this.appBarTitle = new TextField(
                    controller: _cSearch,
                    style: new TextStyle(
                      color: Colors.indigo,
                    ),
                    autofocus: true,
                    onChanged: (value) {
                      this.searching = true;
                      // bloc.getListBySearch(value);
                    },
                    decoration: new InputDecoration(
                        prefixIcon:
                            new Icon(Icons.search, color: Colors.indigo),
                        hintText: "Pesquisar contatos",
                        hintStyle: new TextStyle(color: Colors.indigo)),
                  );
                } else {
                  _cSearch.clear();
                  this.searching = false;
                  this.actionIcon = new Icon(
                    Icons.search,
                  );
                  this.color = Colors.indigo;
                  this.appBarTitle = new Text("Contatos");
                  // bloc.getListContact();
                }
              });
            },
          ),
        ],
      ),
      body: _users.length == 0
          ? Center(child: Text("No user Found, silahkan pencet tombol refresh"))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(_users[index]['avatar'])),
                      title: Text(_users[index]['first_name'] +
                          " " +
                          _users[index]['last_name']),
                      trailing: _users[index]['favorite'] == 1
                          ? Icon(Icons.star, color: Colors.indigo)
                          : Icon(Icons.star_border),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
      // StreamBuilder(
      //   // stream: bloc.listContactOut,
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: CircularProgressIndicator());
      //     }

      //     if (snapshot.hasError) {
      //       print(snapshot.error);
      //       return Text('Error: ${snapshot.error}');
      //     } else {
      //       // bloc.setVisibleButtonSearch(snapshot.data.length > 0 || searching);

      //       if (searching && snapshot.data.length == 0) {
      //         return Column(
      //           children: <Widget>[
      //             Center(
      //                 child: Padding(
      //               padding: const EdgeInsets.all(10),
      //               child: Text("Nenhum contato localizado"),
      //             )),
      //           ],
      //         );
      //       } else {
      //         // return ContactList(items: snapshot.data);
      //       }
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[400],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
      ),
    );
  }
}
