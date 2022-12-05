import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String? err;
  const ShowError(this.err, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(err ?? 'Erreur Iconnu', style: Theme.of(context).textTheme.headline4),
    );
  }
}
