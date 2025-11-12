import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/configs/images/app_images.dart';
import 'package:movie_app/presentation/home/bloc/trending_movie_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_movie_state.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingMovieCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is TrendingMoviesLoaded) {
            final imageUrls = state.movies
                .map(
                  (item) =>
                      AppImages.movieImageBasePath + item.posterPath.toString(),
                )
                .toList();

            print("🎬 Image URLs: $imageUrls");
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map(
                    (item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is FailureLoadTrendingMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
