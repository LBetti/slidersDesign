import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),
            const SizedBox(
              height: 20,
            ),
            const MovieSlider(),
          ],
        ),
      )
    );
  }
}