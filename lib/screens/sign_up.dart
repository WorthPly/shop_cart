import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widget/EnsureVisibleWhenFocused.dart';

class SignUpPage extends StatelessWidget {
  FocusNode _focusNodeNumber = FocusNode();
  FocusNode _focusNodeUseName = FocusNode();
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  static final TextEditingController _userNameController =
      TextEditingController();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _numberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "or sign up with",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(
              flex: 3,
            ),
            IconButton(
              icon: Image.asset(
                "assets/icons/facebook.png",
                height: 35,
                width: 35,
                color: Colors.blue[900],
              ),
              onPressed: () {},
            ),
            Spacer(
              flex: 1,
            ),
            IconButton(
              icon: Image.asset(
                "assets/icons/google.png",
                height: 35,
                width: 35,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
            Spacer(
              flex: 1,
            ),
            IconButton(
              icon: Image.asset(
                "assets/icons/twitter.png",
                height: 35,
                width: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _focusNodeUseName,
          child: new TextFormField(
            decoration: const InputDecoration(
              border: const UnderlineInputBorder(),
              hintText: 'Enter your user name',
              labelText: "User name",
              prefixIcon: Icon(Icons.person_outline),
            ),
            controller: _userNameController,
            focusNode: _focusNodeUseName,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: 22),
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
        const SizedBox(height: 22),
        EnsureVisibleWhenFocused(
          focusNode: _focusNodeNumber,
          child: new TextFormField(
            decoration: const InputDecoration(
              border: const UnderlineInputBorder(),
              hintText: 'Enter your mobile number',
              labelText: "Mobile Number",
              prefixIcon: Icon(Icons.phone_android),
            ),
            controller: _numberController,
            focusNode: _focusNodeNumber,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: 22),
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
        const SizedBox(height: 32),
        InkWell(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "REGISTER",
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
    );
  }


}



