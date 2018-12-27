import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  
  // void _forSubmitted() {
  //   var _form = formKey.currentState;
  //   if (_form.validate()) {
  //     _form.save();
  //   }
  // }
  

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    
    return 
    Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: 
         Form(
      key: formKey,
      child: Column(
          children: <Widget>[
            Text('33'),

            Row(
                children: <Widget>[
                  new Container(
                  child: new Icon(Icons.person, color: Colors.black54),
                  width: 60.0,
                ),
                new Expanded(
                  child: 

                  

                  TextFormField(
                      decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),
                      // obscureText: false,
                      onSaved: (val) {

                      },
                      // keyboardType: TextInputType.text,
                      // autocorrect: false,
                      // enabled: true, //是否允许用户输入
                      style: TextStyle(
                          color: 
                                Colors.black),
                    ),
                )

                ]
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 25.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}