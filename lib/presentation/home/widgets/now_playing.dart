import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/card.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_movie_state.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingMovieCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
        builder: (context, state) {
          if (state is NowPlayingMovieLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is NowPlayingMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(movieEntitie: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 7),
                itemCount: state.movies.length,
              ),
            );
          }
          if (state is FailureLoadNowPlayingMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
