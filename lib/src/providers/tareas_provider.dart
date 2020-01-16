/**
 * Dossier 'providers'
 * Définition 'Fourniseurs' ou Services externes sur lesquelles on va se connecter.
 * Exemples : Base de données sur Firebase, API dynamique, BdD interne avec SQFLite;
 */

class TareasProvider {

  List<Map<String, dynamic>> _tareas;

  static final TareasProvider _instancia = TareasProvider._privado();

  /**
   * Constructeur privado ( _ : tiret bas) appelé qu'une seule fois.
   * Initialiser list de tareas à vide.
   */
  TareasProvider._privado() {
      _tareas = [
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
      ];
  }

  /**
   * Constructeur qu'on pourra l'utiliser.
   * Elle sera public et return instance déjà géneré.
   */
  factory TareasProvider() {
    return _instancia;
  }

  //Méthode public qui return liste de Maps
  List<Map<String, dynamic>> get tareas {
    return _tareas;
  }


  void agregarTarea(Map<String, dynamic> nuevaTarea) {
    _tareas.add(nuevaTarea);
  }

  void editarTarea(Map<String, dynamic> nuevaTarea, Map<String, dynamic> actualTarea){
    for (var i = 0; i < tareas.length; i++) {
      if(_tareas[i]==actualTarea){
        _tareas[i]=nuevaTarea;
        break;
      }
    }
  }

  void eliminarTarea(Map<String, dynamic> borrarTarea){
    _tareas.remove(borrarTarea);
  }

  void terminarTarea(Map<String, dynamic> actualTarea){
    for (var i = 0; i < tareas.length; i++) {
      if(_tareas[i]==actualTarea){
        actualTarea['estado']=true;
        _tareas[i]=actualTarea;
        break;
      }
    }
  }

}