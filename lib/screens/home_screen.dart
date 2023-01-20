import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

      final moviesProvider = Provider.of<MoviesProvider>(context);//relacionado con el provider, pero tiene que saber de cual provider en este casp tiena provider
  //ve a arbol de widgets , buscame la instancia y esa instancia colocala dentro de moviesProvider
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('peliculas en cines'),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {}), 
        ],
      ),
      body: SingleChildScrollView(//singlechilsrolsview crea scrol para ver los objetos is se salen de las dimenciones de la pantalla
        child: Column(
          children: [
            //TODO: poner el CARD SWIPER ya lo puse pero es para recordarmelo :)
      
            //tarjeta principal de peliculas
            CardSwiper(movies: [...moviesProvider.onDisplayMovies],),
      
            //mi descripcion de las peliculas
            MovieSlider(),
            
          ],
        ),
      ),
    );
  }
}