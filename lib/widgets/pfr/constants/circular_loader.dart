import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Theme.of(context).colorScheme.onPrimary,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}