class Domiciliarios {

  String id;
  int cedula;
  String nombre;
  String apellidos;
  int numero;
  bool activo;
  String estado;
  int lat;
  int lon;
  

  Domiciliarios({
    this.id,
    this.cedula,
    this.nombre,
    this.apellidos,
    this.numero,
    this.activo,
    this.estado,
    this.lat,
    this.lon,
    
  });
  // String get name{
  //   return nombre;
  // }
  // set name(String name){
  //   this.name=name;
  // }
  // int get cc{
  //   return cedula;
  // }
  // set cc(int cc){
  //   this.cedula=cc;
  // }
  // String get lastname{
  //   return apellidos;
  // }
  // set lastname(String apellido){
  //   this.apellidos=apellidos;
  // }
  // String get emails{
  //   return email;
  // }
  // set emails(String email){
  //   this.email=email;
  // }
  // int get number{
  //   return numero;
  // }
  // set number(int numero){
  //   this.numero=numero;
  // }

  Domiciliarios.fromJonMap(Map<String,dynamic> json){
    id=json['_id'];
    cedula=json['cc'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    numero = json['numero'];
    activo = json['activo'];
    estado = json['estado'];
    lat = json['lat'];
    lon = json['lon'];

  }
}
class Domiciliario {

  final List<Domiciliarios> domi= new List();

  Domiciliario.fromToList(List<dynamic> domiciliario){

    for (var item in domiciliario) {
      
      final empleado = new Domiciliarios.fromJonMap(item);
      domi.add(empleado);
      
      
    }


  }
  
}