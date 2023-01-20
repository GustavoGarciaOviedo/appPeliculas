

import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.red,
      margin: EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ( _, int index) => _CastCards()
      ),
    );
  }
}
class _CastCards extends StatelessWidget {
  const _CastCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      width: 100,//si se establece esta medida ya la imagen no la puede superar
      height: 120,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              width: 100,
              height: 160,
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://images.pexels.com/photos/14175961/pexels-photo-14175961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              fit: BoxFit.cover),
          ),
          SizedBox(height: 5,),
          Text('actor.nameghdgsgjksgui', style: Theme.of(context).textTheme.button, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)
        ],
      )
    );
  }
}