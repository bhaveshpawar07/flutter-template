import 'package:flutter/material.dart';

class PokemonSearchBodyContent extends StatelessWidget {
  final TextEditingController textController;
  final String searchHint;
  final Widget child;
  final Function() apiCall;

  const PokemonSearchBodyContent({
    Key? key,
    required this.textController,
    required this.searchHint,
    required this.child,
    required this.apiCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: searchHint,
            ),
          ),
          ElevatedButton(
            onPressed: apiCall,
            child: const Text("Search"),
          ),
          child,
        ],
      ),
    );
  }
}
