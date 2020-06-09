import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final bool isLoading;
  final Function() openDrawer;
  final Function(bool) setFilterActive;
  SearchBar({
    @required this.onSearch,
    @required this.isLoading,
    @required this.openDrawer,
    @required this.setFilterActive,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
      ),
      child: Row(
        children: <Widget>[
          widget.isLoading
              ? Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: 27,
                    height: 27,
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                      strokeWidth: 3,
                    ),
                  ))
              : IconButton(
                  splashColor: Colors.grey,
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    widget.openDrawer();
                  },
                ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Buscar..."),
              onSubmitted: (text){
                widget.setFilterActive(text.length > 0);
                widget.onSearch(text);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              child: Icon(Icons.sort, size: 27),
              onTap: () => Navigator.of(context).pushNamed('filter'),
            ),
          ),
        ],
      ),
    );
  }
}
