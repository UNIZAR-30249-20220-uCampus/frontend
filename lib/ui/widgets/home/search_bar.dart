import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final bool isLoading;
  SearchBar({@required this.onSearch, @required this.isLoading});

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
          Padding(
            padding: EdgeInsets.all(12.0),
            child: widget.isLoading
                ? Container(
                    width: 27,
                    height: 27,
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                      strokeWidth: 3,
                    ),
                  )
                : Icon(Icons.search, size: 27),
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Buscar..."),
              onSubmitted: (text) => widget.onSearch(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              child: Icon(Icons.format_list_numbered_rtl, size: 27),
              onTap: () => Navigator.of(context).pushNamed('filter'),
            ),
          ),
        ],
      ),
    );
  }
}
