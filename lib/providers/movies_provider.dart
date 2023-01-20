

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {//es necesarios hacer al extension para que sea un provider como tal

  String _baseUrl ='api.themoviedb.org';//es la pagina como tal
  String _apiKey = '7076dbe0e80d6809dbc21641f73d90d2';//la apikey que me genero la pagina para poder consumir la api
  String _language = 'es-ES'; //el idiomma en este caso quiero que sea en español
  String _segmento = '3/movie/now_playing';//es la parte de la pagina que estoy utilizando para el caso puntual peliculas recientes

  List <Movie> onDisplayMovies=[];//lista de peliculas(qeu espero) las almaceno en un array vacio

  MoviesProvider(){
    print('movies provider inicializado');
    getOnDisplayMovies();
  }


  getOnDisplayMovies() async{
    print('llamado getOnDisplayMovies');
      var url =
      Uri.https(_baseUrl, _segmento, {
        'language': _language,
        'api_key': _apiKey,
        'page': '2',

        });

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  final nowPlayingResponse= NowPlayingResponse.fromJson(response.body);//lo llamo de los modelos, el JSON sale de quictype que convierte la peticion de postman en formato json
  //  final Map<String,dynamic> decodedData = json.decode(response.body);//le asigno de uan vez que es lo que va a recibir.. un mapa de clace string y dimaco
  print(nowPlayingResponse.results[8].title);

  onDisplayMovies = nowPlayingResponse.results;//es compatible con results por que tamnoen es un array, y no con dates cre :)
  notifyListeners();//se redibuja cuando hay un cambio en la data,, notifica a los widgets

  }
  
}