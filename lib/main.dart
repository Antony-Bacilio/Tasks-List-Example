import 'package:flutter/material.dart';

import 'package:tasks_list/src/pages/listado.dart';

import 'src/pages/listado.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tareas',
      initialRoute: ListadoPage.nombrePagina,
      routes: {
        ListadoPage.nombrePagina: (BuildContext context)=> ListadoPage(),
      },
    );
  }
}
