
class Persona {

  int id;
  String nombre;
  String telefono;
  String correo;
  String password;
  String direccion;
  String genero;

  Persona({this.id, this.nombre,  this.telefono,  this.correo,  this.password,  this.direccion, this.genero});

  Map<String, dynamic> toMap() {
    return { 'id': id, 'nombre': nombre, 'telefono': telefono, 'correo': correo, 'password': password, 'direccion': direccion, 'genero': genero};
  }
}