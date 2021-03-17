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
        child: Column(
          children: [_formSearch()],
        ),
      ),
    );
  }

  Widget _formSearch() {
    return Form(
      key: formKey,
      child: TextFormField(
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
}
