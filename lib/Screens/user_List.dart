import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uygulama/Screens/Rive_Animation.dart';
import 'package:uygulama/User/UsersPropertis.dart';
import 'package:uygulama/User/User_Database_Provider.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<User1> allUser ;
  bool aktiflik = false;
  var _controllerusername = TextEditingController();
  var _controllertelno = TextEditingController();
  var _controlleradres=TextEditingController();
  var _formKey = GlobalKey<FormState>();
  int clickedNoteID;

  void getUsers() async {
    var usersFuture = _databaseHelper.getAllU();
    await usersFuture.then((data) {
      setState(() {
        this.allUser = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowRight, size:20),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Animations()));
              },
            ),
          ],
          backgroundColor:Colors.green,
          title: Text("Bilgileri giriniz..!"),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    buildForm(_controllerusername, "kullanıcı adı"),
                    buildForm(_controlleradres, "adres"),
                    buildForm(_controllertelno,"telefon numarası" )
                  ])),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton("Kaydet", Colors.orange, saveObject),
                    buildButton("Güncelle", Colors.yellow, updateObject)
                  ]),
              Expanded(
                  child: ListView.builder(
                      itemCount: allUser.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                                onTap: () {
                                  setState(() {
                                    _controllerusername.text = allUser[index].username;
                                    _controlleradres.text =
                                        allUser[index].adres;
                                    clickedNoteID = allUser[index].id;
                                  });
                                },
                                title: Text(allUser[index].username),
                                subtitle: Text("Kargonuz yola çıktı"),
                                trailing: GestureDetector(
                                  onTap: () {
                                    _deleteUser(allUser[index].id, index);
                                  },
                                  child: Icon(Icons.delete),
                                )));
                      }))
            ])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
            InputDecoration(labelText: str, border: OutlineInputBorder())));
  }

  Widget buildButton(String str, Color buttonColor, Function eventFunc) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(primary:buttonColor),
      child: Text(str),
      onPressed: () {
        eventFunc();
      },
    );
  }

  void updateObject() {
    if (clickedNoteID != null) {
      if (_formKey.currentState.validate()) {
        _uptadeUser(User1.withID(
            clickedNoteID, _controllerusername.text, _controlleradres.text,_controllertelno.text));
      }
    } else {
      alert();
    }
  }

  void saveObject() {
    if (_formKey.currentState.validate()) {
      _addUser(User1(_controllerusername.text, _controlleradres.text,_controllertelno.text));
    }
  }

  void alert() {
    AlertDialog alert = AlertDialog(
      title: Text("SEÇİLİ KULLANICI YOK!"),
      content: Text("Lütfen bir kullanıcı seçerek güncelleme işlemi yapınız!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Crud İşlemlerinin AraYüze Uygulanması

  void _addUser(User1 user1) async {
    await _databaseHelper.insert(user1);

    setState(() {
      getUsers();
      _controllerusername.text = "";
      _controlleradres.text = "";
      _controllertelno.text="";
    });
  }

  void _uptadeUser(User1 user1) async {
    await _databaseHelper.update(user1);

    setState(() {
      getUsers();
      _controllerusername.text = "";
      _controlleradres.text = "";
      _controllertelno.text="";
      clickedNoteID = null;
    });
  }

  void _deleteUser(int deletedUserId, int deletedUserIndex) async {
    await _databaseHelper.delete(deletedUserId);

    setState(() {
      getUsers();
    });
  }
}