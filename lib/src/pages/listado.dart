import 'package:flutter/material.dart';

import '../providers/tareas_provider.dart';
import '../providers/tareas_provider.dart';

class ListadoPage extends StatelessWidget {
  const ListadoPage({Key key}) : super(key: key);
  
  static final nombrePagina = "listado";

  //Data put manually (static). Better if you fetch from DB or API
  static final List<Map<String, dynamic>> tareas = [ //type 'dynamic': accepte n'importe quoi type bool, int, string, etc.
    {
      'nombre': "Tarea uno",
      'description': "Description task one",
      'estado': true,
    },
    {
      'nombre': "Tarea dos",
      'description': "Description second task",
      'estado': false,
    },
    {
      'nombre': "Tarea tres",
      'description': "Description third",
      'estado': true,
    }

  ];


  @override 
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Listado'),
        ),
        body: (TareasProvider().tareas.isNotEmpty)?ListView(
          children: _crearItem(), //Définitions : Methode dans la Class 'ListadoPage' et Fonction dehors la Class
        ):
        Center(
          child: Text("No tasks added"),
        ),
      );
  }

  //Méthode
  List<Widget> _crearItem() {
      List<Widget> tmp = [];

      //Lista de Tareas
      /*for (var i = 0; i < 5; i++) {
        Widget item = ListTile(
          title: Text("Tarea ${i+1}"),
        );
        tmp.add(item);
      }*/

      //Boucle qui utilise notre variable 'static final ... tareas'  
      /*for (Map<String, dynamic> tarea in tareas) {
        Widget item = ListTile(
          title: Text("${tarea['nombre']}"),
          trailing: (tarea['estado'])?Icon(Icons.star):Icon(Icons.star_border),
        );
        tmp.add(item);
      }*/

      //Boucle qui utilise le Providers/tareas_provider.dart
      for (Map<String, dynamic> tarea in TareasProvider().tareas) {
        Widget item = ListTile(
          title: Text("${tarea['nombre']}"),
          trailing: (tarea['estado'])?Icon(Icons.star):Icon(Icons.star_border),
        );
        tmp.add(item);

      }

      return tmp;

  }

}