import 'package:flutter/material.dart';

import 'package:tasks_list/src/pages/listado.dart';
import 'package:tasks_list/src/providers/tareas_provider.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key key}) : super(key: key);

  static final nombrePagina = "formulario";

  _FormularioPageState createState() => _FormularioPageState();

}

class _FormularioPageState extends State<FormularioPage> {
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> nuevaTarea = {};
  Map<String, dynamic> tarea;

  @override
  Widget build(BuildContext context) {
    tarea = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("FORMULARIO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(25.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _crearBotonAgregar(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearInputNombre() {
    return TextFormField(
      initialValue: (tarea!=null)?tarea['nombre']:"",

      onSaved: (valor){
        nuevaTarea['nombre']=valor;
      },
      decoration: InputDecoration(hintText: "Nombre de la tarea"),
    );
  }

  _crearInputDescripcion() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        initialValue: (tarea!=null)?tarea['descripcion']:"",
        onSaved: (valor){
        nuevaTarea['descripcion']=valor;
      },
        maxLines: null,
        decoration: InputDecoration(hintText: "Descripcion de la tarea"),
      ),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: RaisedButton(
        onPressed: () {
          idForm.currentState.save();
          nuevaTarea['estado']=false;

          if(tarea!=null){
            TareasProvider().editarTarea(nuevaTarea, tarea);
            Navigator.popUntil(context, ModalRoute.withName(ListadoPage.nombrePagina));
          } else {
            TareasProvider().agregarTarea(nuevaTarea);
            Navigator.pop(context);
          }
          
        },
        child: (tarea!=null)?Text("EDITAR TAREA"):Text("CREAR TAREA"),
      ),
    );
  }

}