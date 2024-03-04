import 'package:flutter/material.dart';
import 'package:flutter_proyecto_final/src/animations/fade_animations.dart';
import '../widgets/blur_container.dart';
import '../widgets/infotitle_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.color,
      required this.image,
      required this.nombre});
  final int color;
  final String image;
  final String nombre;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double alturadepantalla = 0;

  @override
  Widget build(BuildContext context) {
    alturadepantalla = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(widget.color), Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      height: alturadepantalla * 0.6,
                      child: Hero(tag: widget.color, child: Image.asset(widget.image)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: FadeAnimation(
                      intervalEnd: 0.8,
                        child: BlurContainer(child: Container(
                      width: 160,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1)),
                      child: Text("${widget.nombre}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    )),
                  )
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.3,
                  child: Text("${widget.nombre}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                ),
              ),),
              
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.35,
                child: Text(
                  "Dragon Ball Z",
                  style: TextStyle(color: Colors.white70),
                ),
              ),),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoTitle(title: "Dragon Ball Z", subTitle: "Anime"),
                    InfoTitle(title: "Universo 7", subTitle: "Universo Perteneciente"),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
  onTap: () {
    Navigator.pop(context);
  },
  child: Container(
    width: double.infinity,
    height: 40,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(widget.color),
    ),
    child: const Text(
      "Volver",
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)

            ],
          ),
        ));
  }
}
