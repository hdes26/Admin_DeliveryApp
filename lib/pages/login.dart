import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 100),
      body: Column(children: [
        _fondo(),
        SizedBox(height: 20),
        _form(),
        SizedBox(height: 150),
        _button(context)
        
        
      ],),
    );
  }
}

Widget _button(BuildContext context) {
  return RaisedButton(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
    color: Color.fromRGBO(233, 47, 72, 100),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60),
      ),
      child: Text('Enviar Codigo',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
        ),
      ),
    onPressed: ()=>{Navigator.pushNamed(context, 'loginVerificacion')});
}


Widget _fondo() {
  return Container(
    height: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40)
        ),
      color: Colors.white,
      ),
      
      child: Column(
        children: [
          _logo(),
          SizedBox(height: 10,),
          Row(
            
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Iniciar Sesion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Container(
                      color: Color.fromRGBO(233, 47, 72, 100),
                      height: 9,
                      width: 137,
                    ),

                ],)
              ),

              Expanded(
                child: Column(
                  children: [
                    Text('Registro',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Container(
                      color: Color.fromRGBO(233, 47, 72, 100),
                      height: 9,
                      width: 137,
                    ),

                ],)
              ),
            ]
          ),
        ],
      ),
  );
}

Widget _logo() {
  return Container(
    child: Center(
      heightFactor: 1.8,
      child: Image(
        image: AssetImage('assets/logo.jpg'),
        
      ),
    ),
  );
}

Widget _form() {
  return Container(

    
    child: Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Telefono',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
          ),
          _input(),
        ],
      )
      ),
      
  );
}

Widget _input() {
  return TextField(
    
    keyboardType: TextInputType.number,
    decoration: InputDecoration(),
  );
}