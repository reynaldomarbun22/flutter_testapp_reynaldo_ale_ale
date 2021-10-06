// import 'package:exemplo/src/home/home_bloc.dart';
// import 'package:exemplo/src/home/home_module.dart';
// import 'package:exemplo/src/shared/repository/contact_repository.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testapp_reynaldo_ale_ale/src/homepageList.dart';
import 'package:masked_text/masked_text.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

// import '../app_module.dart';

class AddPage extends StatefulWidget {
  static const routeName = '/addcontact';

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final _cName = TextEditingController();
  final _cNickName = TextEditingController();
  final _cWork = TextEditingController();
  final _cPhoneNumber = TextEditingController();
  final _cEmail = TextEditingController();
  final _cWebSite = TextEditingController();

  var bloc;
  // HomeBloc bloc;
  // ContactRepository contactRepository;

  @override
  void initState() {
    // bloc = HomeModule.to.getBloc<HomeBloc>();
    // contactRepository = AppModule.to.getDependency<ContactRepository>();
    super.initState();
  }

  bool _autoValidate = false;

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      return true;
    } else {
      setState(() {
        _autoValidate = true;
      });
      return false;
    }
  }

  _doTransfer() async {
    if (_validateInputs()) {
      Map<String, Object> param = new Map();
      param['email'] = _cEmail.text;
      param['phoneNumber'] = _cPhoneNumber.text;
      final resp = await http
          .post("https://reqres.in/api/login", body: param)
          .then((res) {
        var resJson = json.decode(res.body);
        // final resp =
        //     await API.post(context, '/transfer/other/online/inquiry', param);
        print(resJson);
        if (resJson == null) return;
        if (resJson['code'] == 0 && resJson['code'] != null) {
          List<dynamic> listMap = resJson['isi'];
          for (var item in listMap) {}
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new HomePage(
                        list: listMap,
                      )));
        } else {
          Toast.show(resJson['error'], context, gravity: Toast.CENTER);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextFormField inputName = TextFormField(
      controller: _cName,
      autofocus: true,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(45),
      ],
      decoration: InputDecoration(
        labelText: 'Nome',
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Obrigatório';
        }
        return null;
      },
    );

    TextFormField inputNickName = TextFormField(
      controller: _cNickName,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(25),
      ],
      decoration: InputDecoration(
        labelText: 'Apelido',
        icon: Icon(Icons.person),
      ),
    );

    TextFormField inputWork = TextFormField(
      controller: _cWork,
      inputFormatters: [
        LengthLimitingTextInputFormatter(45),
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Trabalho',
        icon: Icon(Icons.work),
      ),
    );

    MaskedTextField inputPhoneNumber = new MaskedTextField(
      maskedTextFieldController: _cPhoneNumber,
      mask: "(xxx) xxxxx-xxxx",
      maxLength: 16,
      keyboardType: TextInputType.phone,
      inputDecoration: new InputDecoration(
        labelText: "Telefone",
        icon: Icon(Icons.phone),
      ),
    );

    TextFormField inputEmail = TextFormField(
      controller: _cEmail,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
      ),
    );

    TextFormField inputWebSite = TextFormField(
      controller: _cWebSite,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Site da Web',
        icon: Icon(Icons.web),
      ),
    );

    final picture = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120.0,
          height: 120.0,
          child: CircleAvatar(
            child: Icon(
              Icons.camera_alt,
            ),
          ),
        ),
      ],
    );

    ListView content = ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        SizedBox(height: 20),
        picture,
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              inputName,
              inputNickName,
              inputWork,
              inputPhoneNumber,
              inputEmail,
              inputWebSite,
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Daftar"),
        actions: <Widget>[
          Container(
            width: 80,
            child: IconButton(
              icon: Text(
                'SAVE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // _doTransfer();
                // if (_formKey.currentState.validate()) {
                //   var contactRepository;
                //   contactRepository.insert({
                //     'name': _cName.text,
                //     'nickName': _cNickName.text,
                //     'work': _cWork.text,
                //     'phoneNumber': _cPhoneNumber.text,
                //     'email': _cEmail.text,
                //     'webSite': _cWebSite.text,
                //     'favorite': 0,
                //     'created': DateTime.now().toString()
                //   }).then((saved) {
                //     bloc.getListContact();
                //     Navigator.of(context).pop();
                //   });
                // }
              },
            ),
          )
        ],
      ),
      body: content,
    );
  }
}
