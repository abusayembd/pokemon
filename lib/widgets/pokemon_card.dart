import 'package:flutter/material.dart';
import 'package:pokemon/pages/details_page.dart';

import 'power_badge.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final List<String> types;
  final String imageUrl;
  final Map? pokemonMap;
  const PokemonCard({
    Key? key,
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.pokemonMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(data: pokemonMap),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xff4ad0b0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PowerBadge(text: "${types[0]}"),
                  // PowerBadge(text: "${types[1]}"),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            width: 100.0,
            child: Hero(
              tag: "Pokecard-${name}",
              child: Image.network("$imageUrl"),
            ),
          ),
        ],
      ),
    );
  }
}
