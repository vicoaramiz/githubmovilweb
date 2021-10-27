import 'dart:core';

import 'package:log_reg_sqlite/persona.dart';
import 'package:log_reg_sqlite/db.dart';
import 'package:flutter/material.dart';

class Listar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personas"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context,"/registrar",arguments: Persona(id:0,nombre:"",telefono :"",correo:"",password :"",direccion:"",genero:""));

          },
        ),
        body: Container(
            child: Lista()
        )
    );
  }
}

class Lista extends StatefulWidget {

  @override
  _MiLista createState() => _MiLista();

}

class _MiLista extends State<Lista> {

  List<Persona> personas = [];

  @override
  void initState() {
    cargaPersonas();
    super.initState();
  }

  cargaPersonas() async {
    List<Persona> auxPersona = await DB.personas();

    setState(() {
      personas = auxPersona;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: personas.length,
        itemBuilder:
            (context, i) =>
            Dismissible(key: Key(i.toString()),
                direction: DismissDirection.startToEnd,
                background: Container (
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete, color: Colors.white)
                    )
                ),
                onDismissed: (direction) {
                  DB.delete(personas[i]);
                },
                child: ListTile(
                    title: Text(personas[i].nombre),
                    trailing: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context,"/registrar",arguments: personas[i]);
                        },
                        child: Icon(Icons.edit)
                    )
                )
            )
    );
  }

}