import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sira_base/utilities/logger.dart';

class UserForm extends StatefulWidget {
  BuildContext? dialogContext;
  UserForm({Key? key, this.dialogContext}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: "name",
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: "Nom", label: Text("Nom :")),
              ),
              const SizedBox(height: 15),
              FormBuilderTextField(
                name: "lastname",
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: "Prénom", label: Text("Prénom :")),
              ),
              const SizedBox(height: 15),
              FormBuilderDateTimePicker(
                name: "birthdate",
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: "Date de naissance",
                    label: Text("Date de naissance :")),
              ),
              const SizedBox(height: 15),
              FormBuilderTextField(
                name: "email",
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: "Email", label: Text("Email :")),
              ),
              const SizedBox(height: 15),
              FormBuilderTextField(
                name: "Password",
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Mot de passe", label: Text("Mot de passe :")),
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      height: 60,
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Enregistrer".toUpperCase(),
                        style: GoogleFonts.aBeeZee(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          logInfo("${_formKey.currentState!.value}");
                          // await Get.snackbar(
                          //         "Form Submitted", "success")
                          //     .show();
                          // Get.toNamed("/dashboard");
                          Navigator.pop(widget.dialogContext!);
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
        ));
  }
}
