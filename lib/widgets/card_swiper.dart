import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';


// ESTAS SON LAS TARJETAS GRANDES QUE MUESTRAN LA PELICULA, SE DESLIZA UNA SOBRE OTRA
class CardSwiper extends StatelessWidget {
   
final List<Movie>  movies;
  const CardSwiper({Key? key,
  required this.movies}):super(key: key);//utilizo el constructor, para llamarlo en el home y debe cobtener movies


  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;//con esto se cual es la dimencio de la pantalla

    return Container(
      width: double.infinity,//el ancho de la pantallla
      height: size.height * 0.5,//uso la variable con el alto y muktiplico para darle un porcentaje de esa alto
      color: Color.fromARGB(255, 20, 30, 220),// TODO:  este lo uso como guia,, despues lo quito
      child: Swiper(//estas son las tarjetas que se van a ir mostrando, esto lo importe de card_swiper fluter, y lo puse en el puspec.yaml
        itemCount: movies.length,//cantidad de tarjetas
        layout: SwiperLayout.STACK ,//este es el diseño de las tarjetas, se puede ver la documentacion
        itemWidth: size.width * 0.6,//el ancho que va a ocupar
        itemHeight: size.height * 0.4,

        itemBuilder: (_, index) {//funcion qeu se dispara para construir un nuevo widget
          final movie = movies[index];//me construye segun la cantidad de peliculas que esten
          return GestureDetector(//para qye me detecte cuando haga alguna accion, para este caso el tap'
            onTap: () => Navigator.pushNamed(context,'details'),//cuando haga clic me envia a la pantalla details
            child: ClipRRect(//se envolvio en este wid para asignarle un borde
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), //imagen antes de que carge
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover// cubre el total de la pantalla
                ),
                
            ),
          );
        },
        ),
    );
  }
}