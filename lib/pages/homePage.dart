import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moviedbapp/controllers/movieController.dart';
import 'package:moviedbapp/decorators/moviesRepositoryCachedDecorator.dart';
import 'package:moviedbapp/repositories/impl/moviesRepositoryImpl.dart';
import 'package:moviedbapp/utils/impl/dio_service_impl.dart';
import 'package:moviedbapp/widgets/customListCardWidget.dart';
import 'package:moviedbapp/widgets/searchTextFieldWidget.dart';

import '../models/movies_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRespositoryCachedDecorator(
      MoviesRepositoryImpl(
        DioServiceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (context, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 20),
                        SearchTextFieldWidget(controller: _controller),
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (context, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listMovies[idx]),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .33,
                            ),
                            Lottie.asset('assets/lottie-movie.json'),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
