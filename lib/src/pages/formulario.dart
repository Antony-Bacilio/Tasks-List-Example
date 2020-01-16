import 'package:flutter/material.dart';

import 'package:tasks_list/src/pages/listado.dart';
import 'package:tasks_list/src/providers/tareas_firebase.dart';
import 'package:tasks_list/src/providers/tareas_provider.dart';

class FormularioPage extends StatefulWidget {
    FormularioPage({Key key}) : super(key: key);

    static final nombrePagina = "formulario";

    _FormularioPageState createState() => _FormularioPageState();

}

class _FormularioPageState extends State<FormularioPage> {
    final idForm = GlobalKey<FormState>(); //clé d'un formulaire afin de récuperer les données
    Map<String, dynamic> nuevaTarea = {};
    Map<String, dynamic> tarea;

    @override
    Widget build(BuildContext context) {
      tarea = ModalRoute.of(context).settings.arguments;

      return Scaffold(
        appBar: AppBar(
          title: Text("FORMULARIO"),
        ),
        body: SingleChildScrollView( //Pour éviter dépasser la zone de text de description
          child: Container( //pour avoir accès au margins
            margin: EdgeInsets.all(25.0),
            child: Form(
              key: idForm, //idForm déclaré au début en tant que 'GlobalKey<FormState>()'
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

    //Méthode privée pour traiter le nom
    _crearInputNombre() {
      return TextFormField(
        initialValue: (tarea!=null)?tarea['nombre']:"",

        onSaved: (valor){
          nuevaTarea['nombre']=valor;
        },
        decoration: InputDecoration(hintText: "Nombre de la tarea"),
      );
    }

    //Méthode privée pour traiter la Description
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

    //Méthode privée pour traiter le bouton 'Agregar'
    _crearBotonAgregar(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 25.0),
        child: RaisedButton(
          onPressed: () { //quand bouton tapé
            idForm.currentState.save(); //Tous les éléments
            nuevaTarea['estado']=false;

            if(tarea!=null){
              TareasProvider().editarTarea(nuevaTarea, tarea);
              Navigator.popUntil(context, ModalRoute.withName(ListadoPage.nombrePagina));
            } else {
              TareasFireBase().agregarTarea(nuevaTarea);
              Navigator.pop(context);
            }
            
          },
          child: (tarea!=null)?Text("EDITAR TAREA"):Text("CREAR TAREA"),
        ),
      );
    }


}