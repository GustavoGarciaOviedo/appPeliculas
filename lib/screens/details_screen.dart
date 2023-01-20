import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          
          SliverList(delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              CastingCards(),
              ]
            ))
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          child: Text('pelicula'),
          color: Colors.black45,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          
          ),
        background: FadeInImage(
          placeholder: AssetImage("assets/no-image.jpg"), 
          image: NetworkImage('https://images.pexels.com/photos/14175961/pexels-photo-14175961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          fit: BoxFit.cover,),
          
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top:20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 120,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://images.pexels.com/photos/14175961/pexels-photo-14175961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            width: 140,
            height: 160,
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('titulo', style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text('aqui va una breve descripcin de lo que etengo pensado hacer ', style: Theme.of(context).textTheme.subtitle2, overflow: TextOverflow.ellipsis, maxLines: 2,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.pink,),
                    Expanded(child: Text('valoracion de la pelicula', style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis,))

                  ],)
              ],
              
              ),
          )

      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet hendrerit eros, ac tincidunt urna. Quisque finibus tempus neque in porttitor. Integer vehicula nisi sed vulputate ullamcorper. Phasellus dictum sapien sapien, at gravida felis porttitor vel. Integer eget nunc augue. Maecenas ultrices mauris nulla, sed maximus sapien porta non.',
      style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.justify,),
    );
  }
}