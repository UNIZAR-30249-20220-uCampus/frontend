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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: <Widget>[
            widget.isLoading
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor, strokeWidth: 2,
                      ),
                  ),
                )
                : IconButton(
                    splashColor: Colors.grey,
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Buscar..."),
                onSubmitted: (text) => widget.onSearch(text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  'RD',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
