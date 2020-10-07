import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/ui/home/home_view.dart';
import 'package:tik_tok_clone/view_model/main_model.dart';

import 'model/tik_tok.dart' as tk;
import 'util/extensions/tik_tok_extensions.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final tikToks = List.generate(5, (index) => tk.TikTok().generate());
  runApp(TikTokClone());
}

class TikTokClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainModel>(create: (_) => MainModel()),
        ChangeNotifierProvider<AuthModel>(create: (_) => AuthModel()),
      ],
      child: Auth(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeView(),
        ),
      ),
    );
  }
}

class Auth extends StatelessWidget {
  final Widget child;

  Auth({this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, snapshot, child) {
        return Container(
          child: this.child,
        );
      },
    );
  }
}

enum UserStatus {
  none,
  incognito,
  signedIn,
}

class AuthModel extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  UserStatus status;
  User get user => auth.currentUser;

  AuthModel() {
    updateUserStatus();
  }

  ///Update [status], if auth.User is null, sign in
  Future<void> updateUserStatus() async {
    if (user == null) {
      status = UserStatus.none;
      await auth.signInAnonymously();
      updateUserStatus();
      return;
    } else if (user.uid != null) {
      status = UserStatus.signedIn;
    } else {
      status = UserStatus.incognito;
    }
  }
}
