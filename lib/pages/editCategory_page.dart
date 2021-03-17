import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  EditCategory({Key key}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Editar Categoria", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            _formCategory(),
            _buttonSend(),
          ],
        ),
      ),
    );
  }

  Widget _formCategory() {
    return Form(
      key: formKey,
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
            hintText: "Categoria",
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            focusColor: Colors.red),
        onFieldSubmitted: (value) =>
            {Navigator.pushNamed(context, 'searchPlato')},
      ),
    );
  }

  Widget _buttonSend() {
    // ignore: deprecated_member_use
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          'Editar categoria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {Navigator.pushNamed(context, 'loginVerificacion')});
  }
}
