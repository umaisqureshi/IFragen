import 'package:flutter/material.dart';

Padding trendingScrollWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 20,
      width: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Icon(
        Icons.account_tree,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
