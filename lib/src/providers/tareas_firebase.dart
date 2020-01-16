import 'dart:convert';

import "package:http/http.dart" as http;

class TareasFireBase {
  
  static final TareasFireBase _instancia = TareasFireBase._privado();

  TareasFireBase._privado();

  factory TareasFireBase() {
      return _instancia;
  }

  Future<List<Map<String, dynamic>>> get tareas async{ 
    
    List<Map<String, dynamic>> tareas = [];

    //Récupèrer données par 'json'
    final respuesta = await http.get("https://tasks-list-dae77.firebaseio.com/tareasTable.json"); //Get return 'future' qui est une requête et qu'on attend une réponse (?) => c'est une promesse;
    
    print("json: ${respuesta.body}");
    
    Map<String, dynamic> datos = json.decode(respuesta.body);//decode : recoit un 'json' de return un 'map'

    print("map: $datos");

    datos.forEach((indice, contenido) {
        tareas.add(contenido);
    });

    print("lista: $tareas");

    return tareas;
  }

  Future<bool> agregarTarea(Map<String, dynamic> nuevaTarea) async {
    final respuesta = http.post("https://tasks-list-dae77.firebaseio.com/tareasTable.json", body: json.encode(nuevaTarea));

    return true;
  }

}