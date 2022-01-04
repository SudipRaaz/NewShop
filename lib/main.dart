import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/model/auth%20service/autheticationService.dart';
import 'package:second_shopp/model/data/notification_dao.dart';
import 'package:second_shopp/model/data/registration_dao.dart';
import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:second_shopp/model/data/transaction_dao.dart';
import 'package:second_shopp/theme_data.dart';
import 'page_layout.dart';
import 'model/tab_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SecondShop());
}

class SecondShop extends StatelessWidget {
  SecondShop({Key? key}) : super(key: key);

  final theme = SecondShopTheme.light();
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // CHeck for Errors
          if (snapshot.hasError) {
            print("Something went Wrong");
          }
          // once Completed, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => TabManager()),
                Provider(create: (_) => Sell_Dao()),
                Provider(create: (_) => Registration_Dao()),
                Provider(create: (_) => Transaction_Dao()),
                Provider(create: (_) => Notification_Dao()),
                Provider(create: (_) => CartItems()),
                // for the authentication
                Provider<AuthenticationService>(
                  create: (_) => AuthenticationService(FirebaseAuth.instance),
                ),
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authStateChanges,
                  initialData: null,
                )
              ],
              child: MaterialApp(
                theme: theme,
                home: AuthenticationWrapper(),
              ),
            );
          }

          return CircularProgressIndicator();
        });
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return PageLayout();
    }
    return LoginPage();
  }
}
