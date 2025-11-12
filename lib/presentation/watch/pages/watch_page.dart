import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/domain/movie/entities/movie_entitie.dart';

class WatchPage extends StatelessWidget {
  final MovieEntitie movieEntitie;
  const WatchPage({
    required this.movieEntitie,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
    );
  }
} 