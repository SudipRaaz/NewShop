import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabManager()),
        Provider(create: (_) => Sell_Dao()),
        Provider(create: (_) => Registration_Dao()),
        Provider(create: (_) => Transaction_Dao()),
      ],
      child: MaterialApp(
        theme: theme,
        home: const PageLayout(),
      ),
    );
  }
}
