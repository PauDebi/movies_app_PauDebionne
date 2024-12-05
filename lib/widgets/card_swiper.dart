import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({Key? key, required this.movies}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
      height: size.height * 0.5,
      // color: Colors.red,+
      child:
        Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.45,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: movie),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterPath),
                      fit: BoxFit.cover),
                ),
              ),

              Container(
              child: Text(movies[index].title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )
            ]);
          },
        ),
      );
  }
}
