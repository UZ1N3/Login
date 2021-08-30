import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackerkernel/drivepage.dart';
import 'package:hackerkernel/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orangeAccent[400],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.height, 240),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Image.asset(
                      ("assets/companyLogo.jpg"),
                      height: 70,
                      width: 70,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.orangeAccent[400],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent[400],
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(13)),
                      ),
                      padding: EdgeInsets.all(7),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      var rsp = await login(
                          emailController.text, passwordController.text);
                      print(rsp);
                      if (rsp.containsKey('token')) {
                        setState(() {
                          message = rsp['token'];
                        });
                        if (rsp['token'] == 'QpwL5tke4Pnpja7X4') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => drive()));
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member yet? "),
                      Text(
                        "Click Here",
                        style: TextStyle(
                          color: Colors.orangeAccent[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
