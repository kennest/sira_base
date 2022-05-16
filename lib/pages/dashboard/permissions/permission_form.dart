// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sira_base/utilities/logger.dart';

class PermissionForm extends StatefulWidget {
  BuildContext? dialogContext;
  PermissionForm({Key? key, this.dialogContext}) : super(key: key);

  @override
  State<PermissionForm> createState() => _PermissionFormState();
}

class _PermissionFormState extends State<PermissionForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderDropdown<String>(
                name: "user",
                autofocus: true,
                items: [
                  DropdownMenuItem(
                    child: Text("Oulai Kennest Davis"),
                    value: "user-one",
                  ),
                  DropdownMenuItem(
                    child: Text("Severin Lenaud"),
                    value: "user-two",
                  ),
                ],
                decoration: const InputDecoration(
                    hintText: "Utilisateur", label: Text("Utilisateur :")),
              ),
              const SizedBox(height: 15),
              FormBuilderChoiceChip<String>(name: "rights", options: [
                FormBuilderFieldOption(
                  value: "add",
                  child: Text("Ajouter"),
                ),
                FormBuilderFieldOption(
                  value: "update",
                  child: Text("Modifier"),
                ),
                FormBuilderFieldOption(
                  value: "delete",
                  child: Text("Supprimer"),
                ),
              ]),
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
