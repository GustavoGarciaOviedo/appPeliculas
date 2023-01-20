import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      color: Colors.red,

      child: Column(//por que voy a usar texto imagen y un subtitulo entonces van en columna
        crossAxisAlignment: CrossAxisAlignment.start, //le digo desde donde comienza el widget
        children: [
          const Padding(//envuelto en este widget para ponerle un margen o padding, SOLO AL TEXTO aqui
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  Text('populares', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),)
            ),//tamanio 20 y negrita que es bold

            Expanded(//expanded para que se acomode a las dimensiones del widget padre
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (_, int index) => _MoviePoster(),//esto vendria a ser un bucle
              ),
            ),
            
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 120,
      height: 190,
      color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),//para separar cada imagen 
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context,'details'),//envio a otra pagina
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 150,
                width: 130,
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://images.pexels.com/photos/14175961/pexels-photo-14175961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
                ),
            ),
          ),
            Text(
              'aqui va una breve reseña de lo que consta la pelicula',
              textAlign: TextAlign.center,//alinea al centro el texto
              overflow: TextOverflow.ellipsis,//si el texto no cabe, pone puntos...
              maxLines: 2,
              
            )
            
        ],
      ),
    );
  }
}