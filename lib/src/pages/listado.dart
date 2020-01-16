import 'package:flutter/material.dart';

import 'package:tasks_list/src/pages/detalle.dart';
import 'package:tasks_list/src/pages/formulario.dart';
import 'package:tasks_list/src/providers/tareas_provider.dart';
import '../providers/tareas_provider.dart';


class ListadoPage extends StatefulWidget {
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
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  @override
  //Définir ce qu'il y a à l'interieur
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Listado'),
        ),
        body: (TareasProvider().tareas.isNotEmpty)?ListView(
          children: _crearItem(context), //Définitions : Methode dans la Class 'ListadoPage' et Fonction dehors la Class
        ):
        Center(
          child: Text("No tasks added"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, FormularioPage.nombrePagina),
          child: Icon(
            Icons.add,
          ),
        ),
      );
  }

  List<Widget> _crearItem(BuildContext context) {
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
          onTap: () {
              Navigator.pushNamed(context, DetallePage.nombrePagina, arguments: tarea);
          },
          title: Text("${tarea['nombre']}"),
          trailing: (tarea['estado'])?Icon(Icons.star):Icon(Icons.star_border),
        );
        tmp.add(item);

      }

      return tmp;

  }
}