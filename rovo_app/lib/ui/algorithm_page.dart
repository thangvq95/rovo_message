
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/provider/app_provider.dart';

class AlgorithmPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<AppProvider>(context).curTheme.background,
      child: Container(),
    );
  }

}