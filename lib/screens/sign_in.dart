import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home_page.dart';
import 'package:flutter_ecommerce_app/widget/EnsureVisibleWhenFocused.dart';

class SignInPage extends StatelessWidget {
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  _openHome(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        children: <Widget>[
          EnsureVisibleWhenFocused(
            focusNode: _focusNodeEmail,
            child: new TextFormField(
              decoration: const InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Enter your email address',
                labelText: "Email",
                prefixIcon: Icon(Icons.mail_outline),
              ),
              controller: _emailController,
              focusNode: _focusNodeEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          EnsureVisibleWhenFocused(
            focusNode: _focusNodePassword,
            child: new TextFormField(
              decoration: const InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Enter your password',
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
              controller: _passwordController,
              focusNode: _focusNodePassword,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              _openHome(context);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
