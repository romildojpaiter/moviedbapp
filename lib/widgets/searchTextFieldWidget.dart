import 'package:flutter/material.dart';
import 'package:moviedbapp/controllers/movieController.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required MovieController controller,
  }) : _controller = controller;

  final MovieController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.05),
            Colors.grey.withOpacity(0.15),
            Colors.grey.withOpacity(0.05),
          ],
          stops: [0, 7, 1],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: _controller.onChanged,
              decoration: const InputDecoration(
                label: Text('Search'),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white30,
                focusColor: Colors.white30,
                hoverColor: Colors.white30,
              ),
              cursorColor: Colors.white30,
            ),
          ),
        ],
      ),
    );
  }
}
