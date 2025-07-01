import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;

  const CustomAppBar({
    Key? key,
    required this.titleAppBar,
    this.onPressedSearch,
    required this.onPressedIconFavorite,
    this.onChanged,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            controller: myController,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: onPressedSearch,
              ),
              hintText: titleAppBar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
            onPressed: onPressedIconFavorite,
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: Colors.grey[600],
            ),
          ),
        ),
      ]),
    );
  }
}
