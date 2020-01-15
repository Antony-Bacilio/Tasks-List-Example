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


}