import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sira_base/services/auth_service.dart';
import 'package:sira_base/utilities/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final continents = [
    'Africa',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America'
  ];
  @override
  void initState() {
    // var authService = getIt.get<AuthService>();
    // authService.doLogin("");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "SIRA CONNECTION HUB",
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height / 6,
                left: MediaQuery.of(context).size.width / 2.1,
                child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.lock,
                      size: 80,
                      color: Colors.grey,
                    ))),
            Positioned(
                top: MediaQuery.of(context).size.height / 3.5,
                left: MediaQuery.of(context).size.width / 3,
                child: Align(
                  alignment: Alignment.center,
                  child: LimitedBox(
                    maxHeight: MediaQuery.of(context).size.height / 3,
                    maxWidth: MediaQuery.of(context).size.width / 3,
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                FormBuilderTextField(
                                  name: "email",
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                      hintText: "Email",
                                      label: Text("Email :")),
                                ),
                                const SizedBox(height: 15),
                                FormBuilderTextField(
                                  name: "Password",
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Mot de passe",
                                      label: Text("Mot de passe :")),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: MaterialButton(
                                        height: 60,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        child: Text(
                                          "Connexion".toUpperCase(),
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          _formKey.currentState!.save();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            logInfo(
                                                "${_formKey.currentState!.value}");
                                            // await Get.snackbar(
                                            //         "Form Submitted", "success")
                                            //     .show();
                                            Get.toNamed("/dashboard");
                                          } else {
                                            logError("validation failed");
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ))
          ],
        ));
  }
}
