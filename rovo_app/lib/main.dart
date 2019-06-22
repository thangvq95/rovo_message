import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/assets.dart';
import 'package:rovo_app/service_locator.dart';
import 'configs/routes.dart';
import 'data/message_repository.dart';

void main(){
  // Setup Service Provide
  setupServiceLocator();
  runApp(ChangeNotifierProvider.value(
    value: getIt<AppProvider>(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(getIt<AppProvider>().curTheme.statusBar);

    return MaterialApp(
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        fontFamily: 'Rubik',
        brightness: getIt<AppProvider>().curTheme.brightness,
        primaryColor: getIt<AppProvider>().curTheme.primaryColor,
        accentColor: getIt<AppProvider>().curTheme.accentColor,
        backgroundColor: getIt<AppProvider>().curTheme.background,
        dialogBackgroundColor: getIt<AppProvider>().curTheme.backgroundDialog,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initData();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<AppProvider>(context).curTheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(Assets.logo_text, height: 100, width: 100,),
            CircularProgressIndicator(strokeWidth: 2.0,valueColor: AlwaysStoppedAnimation<Color>(getIt<AppProvider>().curTheme
                .accentColor))
          ],
        ),
      ),
    );
  }

  /// Load init data from Server at SplashScreen
  /// Don't care complete or not => GoTo HomePage
  void initData() {
    loadData().timeout(Duration(seconds: 3)).whenComplete((){
      // Complete or timeout
      Navigator.pushReplacementNamed(context, Navigation.MessagePage);
    });
  }

  Future loadData() async {
    try{
      await getIt<MessageRepository>().getMessage().then((_){
        print('data: '+_.toString());
      });
    }catch(error){
      print(error.toString());
    }
  }
}
