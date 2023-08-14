import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late double _deviceHeight, _deviceWidth;
  late Color _primaryColor, _secondaryColor;

  @override
  Widget build(BuildContext context) {
    _primaryColor = Color.fromRGBO(125, 191, 211, 1);
    _secondaryColor = Color.fromRGBO(169, 224, 241, 1);

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _primaryColor,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _avatarWidget(),
                Column(
                  children: [
                    _emailTextField(),
                    _passwordTextField(),
                  ],
                ),
                _loginButton(),
              ],
            ),
          ),
        ));
  }

  Widget _avatarWidget() {
    return Container(
      width: _deviceHeight * 0.25,
      height: _deviceHeight * 0.25,
      decoration: BoxDecoration(
        color: _secondaryColor,
        borderRadius: BorderRadius.circular(500),
        image: const DecorationImage(
          image: AssetImage('assets/images/main_avatar.png'),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Titikhalil@gmail.com',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        obscureText: true,
        obscuringCharacter: "*",
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.white)),
      onPressed: () {},
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      child: Text("LOG IN",
          style: TextStyle(
              fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold)),
    );
  }
}
