import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

import 'providers/movies_provider.dart';


void main() => runApp(AppState());//estoy diciendo que se llame prinmero el provider

//para disparar la peticion cuando cargue la pagina
//va en una parte superior porque se usa en toda la aplicacion y se requiere quedema classes hagan uso de la peticion
class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //se crea el widget que va a aceptar el provider
    return MultiProvider(
      providers: [//como pueden ser varios va dentro de una coleccion array etc
      //cambiar la notificacion del procverdor
        ChangeNotifierProvider( create: ( _ ) => MoviesProvider(), lazy: false,
        )
        ],
        child: MyApp(),//estopy llamando ahi si el main como widget despues de tener cargado el provider
        );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//quito el letrero maulo de debug
      title: 'peliculas',
      initialRoute:'home',//por donde va a iniciar la vista
      routes: { 
        'home':(_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()
      },
      //laterar el tema global de algun widget
      theme: ThemeData.light().copyWith(//este es el caso del light por que esta el dark tambien
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        ),
        
      ),
      
    );
  }
}