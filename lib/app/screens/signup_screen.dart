import 'package:flutter/material.dart';
import 'package:flutternews/app/screens/news_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password, _name;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your name' : null,
                      onSaved: (value) => _name = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your email' : null,
                      onSaved: (value) => _email = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) =>
                          value!.length < 6 ? 'Password too short' : null,
                      onSaved: (value) => _password = value,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .signUp(_email!, _password!, _name!)
                                .then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsScreen()));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
