import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/custom/button.dart';
import 'package:rovo_app/custom/text_field.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/utils/algorithm.dart';

class AlgorithmPage extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<AppProvider>(context).curTheme.background,
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 50),
        child: ChangeNotifierProvider(
          builder: (context) => InputHourNotifier(),
          child: Consumer<InputHourNotifier>(
            builder: (context, value, child) {
              return Column(
                children: <Widget>[
                  Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomTextFormField(
                      hintText: 'input hour (<18)',
                      controller: controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  PrimaryButton('Composite', onPressed: () {
                    value.composite(controller.text);
                  }),
                  Expanded(
                    child: Container(
                      alignment: Alignment(-1, 0),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            value.result[index],
                            style: AppStyles.textStyleItem(),
                            maxLines: 1,
                          );
                        },
                        itemCount: value.result.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class InputHourNotifier with ChangeNotifier {
  List<String> result = [];

  void composite(String input) {
    try {
      int number = int.parse(input);
      if(number<18){
        result = Algorithm.conductSession1_2(number);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
