import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/presentation/entity/pokemon/ui_pokemon.dart';

class UIPokemonListItem extends StatelessWidget {
  final UIPokemon pokemon;
  final int orientation;

  const UIPokemonListItem({
    Key? key,
    required this.pokemon,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: orientation > 1 ? landscapeView() : portraitView(),
        ),
      ),
    );
  }

  Widget landscapeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SvgPicture.network(
        SvgPicture.network(
          pokemon.imgUrl,
          height: 250,
          width: 100,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
        Column(
          children: [
            Text(
              pokemon.name,
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height : ${pokemon.height}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Weight : ${pokemon.weight}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget portraitView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.network(
          pokemon.imgUrl,
          height: 250,
          width: 100,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
        Text(
          pokemon.name,
          style: const TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height : ${pokemon.height}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Weight : ${pokemon.weight}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
