import 'package:flutter/material.dart';
import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/utils/api.utils.dart';

class ListMoviesWidget extends StatelessWidget {
  final Movie movie;
  const ListMoviesWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  API.RESQUEST_IMG(movie.posterPath),
                  fit: BoxFit.fill,
                  loadingBuilder: (_, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.title),
                Text(movie.originalTitle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.new_releases),
                Text(movie.releaseDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
