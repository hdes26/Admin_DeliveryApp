// Generated by https://quicktype.io

class Categoria {
  String id;
  String nombre;

  Categoria({
    this.id,
    this.nombre,
  });

  Categoria.fromJsonMap(Map<String, dynamic> json) {
    id = json['_id'];
    nombre = json['nombre'];
  }
}

class Categorias {
  // ignore: deprecated_member_use
  final List<Categoria> categorys = new List();
  Categorias();
  Categorias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final category = new Categoria.fromJsonMap(item);
      categorys.add(category);
    }
  }
}
