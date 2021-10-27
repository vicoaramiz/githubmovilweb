import 'package:log_reg_sqlite/persona.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'personas.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE personas (id INTEGER PRIMARY KEY, nombre TEXT, telefono TEXT, correo TEXT, password TEXT, direccion TEXT, genero TEXT)",
          );
        }, version: 1);
  }

  static Future<void> insert(Persona persona) async {
    Database database = await _openDB();

    return database.insert("personas", persona.toMap());
  }

  static Future<void> delete(Persona persona) async {
    Database database = await _openDB();

    return database.delete("personas", where: "id = ?", whereArgs: [persona.id]);
  }

  static Future<void> update(Persona persona) async {
    Database database = await _openDB();

    return database.update("personas", persona.toMap(), where: "id = ?", whereArgs: [persona.id]);
  }

  static Future<List<Persona>> personas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> personasMap = await database.query(
        "personas");

    return List.generate(personasMap.length,
            (i) =>
            Persona(
                id: personasMap[i]['id'],
                nombre: personasMap[i]['nombre'],
                telefono: personasMap[i]['telefono'],
                correo: personasMap[i]['correo'],
                password: personasMap[i]['password '],
                direccion: personasMap[i]['direccion'],
                genero: personasMap[i]['genero']
            ));
  }

  // CON SENTENCIAS
  static Future<void> insertar2(Persona persona) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert(
        "INSERT INTO personas (id, nombre, telefono, correo, password, direccion, genero  )"
            " VALUES (${persona.id}, ${persona.nombre}, ${persona
            .telefono}, ${persona.correo}, ${persona.password}, ${persona
            .direccion}, ${persona.genero})");
  }
}
