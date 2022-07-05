import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extensions/theme_ext.dart';
import 'package:shimmer/shimmer.dart';

class PokemonSearchPageLoadingShimmer extends StatelessWidget {
  const PokemonSearchPageLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Shimmer.fromColors(
          baseColor: context.theme.colorScheme.surfaceVariant.withOpacity(0.2),
          highlightColor:
              context.theme.colorScheme.onSurfaceVariant.withOpacity(0.1),
          period: const Duration(seconds: 1),
          direction: ShimmerDirection.ltr,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                        ),
                        Container(
                          width: 250,
                          height: 30,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                        ),
                        Container(
                          width: 150,
                          height: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}
