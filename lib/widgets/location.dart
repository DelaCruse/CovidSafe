import 'dart:async';

import 'package:covidsafe/themes/themes.dart';
import 'package:covidsafe/utils/googleLocationSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

String currentLocation = 'Choose your location';

class _LocationState extends State<Location> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            var modalBottomSheetController = showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: CircleBorder(),
                builder: (builder) {
                  return FractionallySizedBox(
                    heightFactor: 0.6,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0)),
                        color: Themes().getExploreCardColor(context),
                      ),
                      child: EnterLocationBottomSheet(),
                    ),
                  );
                });
            modalBottomSheetController.then((void value) {
              modalBottomSheetClosed();
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                IconData(0xe900, fontFamily: 'Icon Location'),
                size: 24.0,
                color: Themes().primaryColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  currentLocation,
                  style: TextStyle(fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'reload',
          icon: Icon(
            IconData(0xe900, fontFamily: 'Icon Refresh'),
            size: 20.0,
            color: Themes().primaryColor,
          ),
          iconSize: 24.0,
        )
      ],
    );
  }

  modalBottomSheetClosed() {
    setState(() {
//      print(currentLocation);
    });
  }
}

class EnterLocationBottomSheet extends StatefulWidget {
  @override
  _EnterLocationBottomSheetState createState() =>
      _EnterLocationBottomSheetState();
}

class _EnterLocationBottomSheetState extends State<EnterLocationBottomSheet> {
  final List<SearchResultRow> _searchResults = <SearchResultRow>[];
  bool _showLoading = false;

  final TextEditingController _searchTextController =
      new TextEditingController();
  Timer _debounce;

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchTextController.removeListener(_onSearchTextChanged);
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Search location',
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _searchTextController,
          decoration: InputDecoration(
            hintText: 'Search location',
            hintStyle: TextStyle(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Image(
            image: Themes().getPoweredByGoogle(context),
            width: 120,
            height: 30,
          ),
        ),
        SizedBox(height: 5),
        FlatButton(
          splashColor: ThemeData().splashColor,
          padding: EdgeInsets.all(0),
          onPressed: () {
            setState(() {
              GoogleLocationSearch().getCurrentLocation().then((location) {
                currentLocation = location;
                Navigator.pop(context);
              });
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.my_location,
                  size: 24.0,
                  color: Themes().primaryColor,
                ),
              ),
              Text(
                'Use current location',
                style: TextStyle(fontSize: 18.0, color: Themes().primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Visibility(
          visible: _showLoading,
          child: Center(
            child: CupertinoActivityIndicator(
              radius: 14,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemBuilder: (_, int index) => _searchResults[index],
                  itemCount: _searchResults.length,
                ),
              ),
              Divider(height: 1.0),
            ],
          ),
        ),
      ],
    );
  }

  _onSearchTextChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      Future results =
          GoogleLocationSearch().getSearchResult(_searchTextController.text);
      results.then((results) {
        _searchResults.clear();
        _showLoading = true;
        for (var result in results) {
          if (result['structured_formatting']['main_text'] != null &&
              result['structured_formatting']['secondary_text'] != null) {
            SearchResultRow searchResultRow = new SearchResultRow(
                mainText: result['structured_formatting']['main_text'],
                secondaryText: result['structured_formatting']
                    ['secondary_text']);
            setState(() {
              _showLoading = false;
              _searchResults.add(searchResultRow);
            });
          }
        }
      });
    });
  }
}

class SearchResultRow extends StatefulWidget {
  SearchResultRow({this.mainText, this.secondaryText});

  final String mainText;
  final String secondaryText;

  @override
  _SearchResultRowState createState() => _SearchResultRowState();
}

class _SearchResultRowState extends State<SearchResultRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          setState(() {
            currentLocation = widget.mainText + ', ' + widget.secondaryText;
            Navigator.pop(context);
          });
        },
        splashColor: ThemeData().splashColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.location_on),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.mainText,
                      style: Theme.of(context).textTheme.subhead,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.secondaryText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
