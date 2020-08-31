import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
final _formKey= GlobalKey<FormState>();
bool isLoading=false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
      ),
body: Padding(
  padding: EdgeInsets.all(16.0),
  child: (isLoading) ? _drawLoading() : _drawForm(),
),
    );
  }

 Widget _drawLoading() {
  return Container(
    child: Center(child: CircularProgressIndicator()),
  );
 }
 Widget _drawForm(){
  return Form(
    key: _formKey,
    child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'User Name',
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),
        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
        ),
        Container
          (
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: RaisedButton(
            onPressed: (){
              if(_formKey.currentState.validate()){
                //call API
                setState(() {
                  isLoading = true;
                });
              }
            },

            color: Colors.blue,
            child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        )
      ],
    ),

  );
 }
}
