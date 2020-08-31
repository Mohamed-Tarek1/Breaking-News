import 'package:flutter/material.dart';
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey= GlobalKey<FormState>();
  bool isLoading=false;
TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController messageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    emailController=TextEditingController();
    messageController=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us"),centerTitle: true,),
      body:Padding(
        padding: EdgeInsets.only(top:8.0,left: 16.0,right: 16.0,bottom: 8),
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
    return Flexible(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Your Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Your email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,

              ),
              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            Container
              (
             // padding: EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    //Loading ,Send message
                    String name=nameController.text;
                    String email=emailController.text;
                    String message=messageController.text;
                    setState(() {
                      isLoading = true;
                    });
                  }else{
                    setState(() {
                      isLoading=false;
                    });
                  }
                },

                color: Colors.blue,
                child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            )
          ],
        ),
      ),
    );
}
}
