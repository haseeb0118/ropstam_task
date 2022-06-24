import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rosptam_task/widget/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/http_service.dart';
import '../widget/auth_button.dart';
import '../widget/re_use_socil_media_icon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _secureText = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
    inAsyncCall: showSpinner,
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.greenAccent.shade100])),
        child : SingleChildScrollView(
          child: Column(
          children:  [
            const SizedBox(height: 130,),
            const Center(
              child: Text('Hello Again!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Chance to get your life better',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            ),
            const SizedBox(height: 40.0),
      Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children:  <Widget>[
              // Email TextField
              Container(
                padding: const EdgeInsets.only(left: 30,top: 5.0),
                height: 65,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextFormField(
                  controller: _email,
                  validator: (email) {
                    if (email!.isEmpty)
                    {
                      return 'Please enter required email';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email))
                    {
                      return 'Email are not Valid';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _email.text = value!;
                  },
                  decoration:  const InputDecoration(
                      labelText: 'Enter Username',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),

              const SizedBox(
                height: 25,),

              // Password TextField
              Container(
                padding: const EdgeInsets.only(left: 30,top: 5.0),
                height: 65,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextFormField(
                  controller: _password,
                  obscureText: _secureText,
                  validator: (password) {
                    if(password!.isEmpty) {
                      return 'please enter your correct password';
                    }
                    if (password.length < 6 ) {
                      return 'password should at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _password.text = value!;
                  },
                  decoration:  InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _secureText = !_secureText;
                            });

                          },
                          child: Icon(_secureText ? Icons.visibility_off
                              : Icons.visibility,
                            color: Colors.green,
                          )),
                      labelText: 'Password',
                      border: InputBorder.none,
                      labelStyle: const TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: (){},
                child: const Padding(
                  padding: EdgeInsets.only(left: 200,right: 5),
                  child: Text("Recovery Password",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              AuthButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      showSpinner = true;
                    });
                    HttpService.login(_email.text.toString(),
                        _password.text.toString(),
                        "zasdcvgtghnkiuhgfde345tewasdfghjkm".toString(),
                        context);
                    final SharedPreferences sharedPreference = await
                    SharedPreferences.getInstance();
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', _email.text);
                  }
                }, text: 'Login',
              ),
              const SizedBox(height: 25),
              const Text('or continue with',
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReUseSocialMediaIcon(iconData: FontAwesomeIcons.google,
                    color: Colors.red,),
                  ReUseSocialMediaIcon(iconData: FontAwesomeIcons.apple,
                    color: Colors.black,),
                  ReUseSocialMediaIcon(iconData: FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,),
                ],
              ),
              const SizedBox(height: 25),

              const SizedBox(height: 16.0),
              CustomRichText(
                discription: 'Not a member?',
                text: "Register Now",
                onTap: () {},
              ),
            ],

          ),
      )
          ],
      ),
        ),
    )
    ));
  }
}
