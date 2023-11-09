import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _CustomAppbar(),
        SliverList(
          delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _Overview(),
            const _Overview(),
            const CastingCards(),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text('movie.title'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('movie.voteAverage', style: textTheme.bodySmall)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        'Dolor in laborum ad sunt. Occaecat pariatur occaecat aliqua nostrud sunt. Deserunt cillum aliqua dolor incididunt nisi sint sunt voluptate ullamco quis nulla. Do enim eiusmod dolore eiusmod ex sunt esse et eu.Qui id eiusmod sunt proident quis. Ipsum ipsum nulla laborum consectetur ad do ullamco eu voluptate eu pariatur aliquip esse nisi. Tempor commodo nulla velit sunt sit excepteur quis. Elit incididunt proident nostrud irure laborum cillum. Consequat eiusmod enim nulla aliqua sint. Do nisi id dolore nisi magna culpa pariatur id consectetur aliquip do reprehenderit qui voluptate.',
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium,
      ),
    );
  }
}
