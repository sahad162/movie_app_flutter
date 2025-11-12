
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';
import 'package:movie_app/domain/movie/entities/movie_entitie.dart';
import 'package:movie_app/presentation/watch/pages/watch_page.dart';
class MovieCard extends StatelessWidget {
  final MovieEntitie movieEntitie;
  const MovieCard({
    required this.movieEntitie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final posterUrl = movieEntitie.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500${movieEntitie.posterPath}'
        : 'https://via.placeholder.com/150';

    final title = movieEntitie.originalTitle ?? 'Untitled';

    return GestureDetector(
      onTap: () {
        AppNavigator.push(context,WatchPage(
          movieEntitie: movieEntitie,
        ));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.secondBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(posterUrl),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
