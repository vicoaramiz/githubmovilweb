import 'package:log_reg_sqlite/db.dart';
import 'package:log_reg_sqlite/persona.dart';
import 'package:flutter/material.dart';

class Registrar extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final direccionController = TextEditingController();
  final generoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Persona persona = ModalRoute.of(context).settings.arguments;
    nombreController.text = persona.nombre;
    telefonoController.text = persona.telefono;
    correoController.text = persona.correo;
    passwordController.text = persona.password;
    direccionController.text = persona.direccion;
    generoController.text = persona.genero;

    return Scaffold(
        appBar: AppBar(
            title: Text("Guardar")
        ),
        body: Container(
            child: Padding(
              child: Form (
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: nombreController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El nombre es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Nombre"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ////////////////////////
                        TextFormField(
                          controller: telefonoController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El telefono es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "telefonoe"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: correoController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El correo es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "correo"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El password es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "password"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: direccionController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El direccion es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "direccion"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: generoController,
                          validator: (value) {
                            if (value.isEmpty)
                              return "El genero es obligatorio";
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "genero"
                          ),

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ////////////////////////

                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if (persona.id > 0) {
                                  persona.nombre = nombreController.text;
                                  persona.telefono  = telefonoController.text;
                                  persona.correo = correoController.text;
                                  persona.password  = passwordController.text;
                                  persona.direccion  = direccionController.text;
                                  persona.genero = generoController.text;
                                  DB.update(persona);
                                }
                                else
                                  DB.insert(Persona(nombre: nombreController.text, telefono: telefonoController.text, correo: correoController.text, password: passwordController.text, direccion: direccionController.text, genero: generoController.text));
                                Navigator.pushNamed(context,"/");
                              }
                            },
                            child: Text("Guardar"))
                      ]
                  )
              ),
              padding: EdgeInsets.all(15),
            )
        )
    );
  }

}