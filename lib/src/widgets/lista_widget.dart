import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import 'package:flutter/cupertino.dart';

class listaPersonajes extends StatefulWidget {
  const listaPersonajes({super.key});
  @override
  State<listaPersonajes> createState() => _listaPersonajesState();
}

class _listaPersonajesState extends State<listaPersonajes> {
  double widthPantalla = 0;
  final tituloStyleText = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    widthPantalla = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Sagas Mas recientes",
            style: tituloStyleText,
          ),
          Row(
            children: [
              bloquesPortada("saga1.jpg", "torneo del poder", "2015"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquesPortada("saga2.jpg", "saga de black", "2014"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquesPortada("saga3.jpg", "batalla de los dioses", "2014"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 10,
          ),
          bloquePersonajes("Goku", 0xFFFF3D00, "goku"),
          bloquePersonajes("Vegetta", 0xFF01579B, "vegeta"),
          bloquePersonajes("Piccoro", 0xFF76FF03, "picoro"),
          bloquePersonajes("Gohan", 0xFFDD2C00, "gohan"),
          bloquePersonajes("Trunks", 0xFF4A148C, "trunks"),
          bloquePersonajes("Maestro Roshi", 0xFFFFFF00, "roshi"),
          bloquePersonajes("Bulma", 0xFF00E676, "bulma"),
          bloquePersonajes("Androide 18", 0xFFD50000, "numero18"),
          bloquePersonajes("Freezer", 0xFF4A148C, "freezer"),
          bloquePersonajes("Androide 17", 0xFF263238, "numero17"),
          bloquePersonajes("Krilin", 0xFFDD2C00, "krilin"),
          bloquePersonajes("Yamcha", 0xFFDD2C00, "yamcha"),
          bloquePersonajes("Bills", 0xFF4A148C, "bills"),
        ],
      ),
    );
  }

  Widget bloquePersonajes(String nombre, int color, String imagen) {
    return GestureDetector(
        onTap: ()=> {
          Navigator.of(context).push(
            CupertinoPageRoute(
                builder: (context) => DetailPage(
                    color: color,
                    image: "assets/$imagen.png",
                    nombre: nombre,
                  )))
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(66, 239, 239, 241)),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                          spreadRadius: 0.0,
                          blurStyle: BlurStyle.normal,
                          color: Color(color))
                    ], borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(8),
                    child: Hero(tag: color, child: Image.asset("assets/$imagen.png"),),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    nombre,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_rounded),
                color: Colors.grey,
                )
            ],
          ),
        ),);
  }

  Column bloquesPortada(String image, String titulo, String subTitulo) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: widthPantalla * 0.31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: TextSpan(
                text: titulo,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                children: [
              TextSpan(
                  text: subTitulo,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 49, 77, 204),
                      fontWeight: FontWeight.w300,
                      fontSize: 12))
            ]))
      ],
    );
  }
}
