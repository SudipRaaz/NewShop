import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/data/sell_dao.dart';
import 'package:second_shopp/theme_data.dart';

import 'page_layout.dart';
import 'model/tab_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SecondShop());
}

class SecondShop extends StatelessWidget {
  const SecondShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SecondShopTheme.light();
    return MaterialApp(
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          Provider(create: (_) => Sell_Dao()),
        ],
        child: const PageLayout(),
      ),
    );
  }
}
