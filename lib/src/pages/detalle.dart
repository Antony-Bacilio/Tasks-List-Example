import 'package:flutter/material.dart';
import 'package:tasks_list/src/pages/formulario.dart';
import 'package:tasks_list/src/providers/tareas_provider.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({Key key}) : super(key: key);

  static final nombrePagina = "detalle";

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> tarea = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              bottom: 40.0
            ),
            child: Text("${tarea['nombre']}", style: TextStyle(fontSize: 20.0),)
            ),
          Text("Descripción:"),
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              bottom: 40.0
            ),
            child: Text("${tarea['descripcion']}")
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                textColor: Colors.black,
                onPressed: () {
                  TareasProvider().terminarTarea(tarea);
                  Navigator.pop(context);
                },
                child: Text("Finalizar Tarea"),
              ),
              RaisedButton(
                color: Colors.yellow,
                textColor: Colors.black,
                onPressed: ()=> Navigator.pushNamed(context, FormularioPage.nombrePagina, arguments: tarea),
                child: Text("Editar Tarea"),
              ),
              RaisedButton(
                color: Colors.red,
                textColor: Colors.black,
                onPressed: () {
                  TareasProvider().eliminarTarea(tarea);
                  Navigator.pop(context);
                },
                child: Text("Eliminar Tarea"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
