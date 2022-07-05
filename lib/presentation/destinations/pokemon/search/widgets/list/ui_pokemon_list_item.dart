import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../entity/pokemon/ui_pokemon.dart';

class UIPokemonListItem extends StatelessWidget {
  final UIPokemon pokemon;

  const UIPokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.network(
                pokemon.imgUrl,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
              // Image(
              //   image: CachedNetworkImageProvider(
              //     pokemon.imgUrl,
              //   ),
              // ),
              // Expanded(
              //     child: Image(
              //   image: CachedNetworkImageProvider(
              //     pokemon.imgUrl,
              //   ),
              // )),
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
          ),
          // Flex(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   direction: Axis.vertical,
          //   children: [
          //     Expanded(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Expanded(
          //               child: Image(
          //             image: CachedNetworkImageProvider(
          //               pokemon.imgUrl,
          //             ),
          //           )),
          //           Text(
          //             pokemon.name,
          //             style: const TextStyle(fontSize: 40),
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                 "Height : ${pokemon.height}",
          //                 style: const TextStyle(fontSize: 20),
          //               ),
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 "Weight : ${pokemon.weight}",
          //                 style: const TextStyle(fontSize: 20),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
