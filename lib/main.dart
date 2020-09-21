import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/ui/home/home_view.dart';
import 'package:tik_tok_clone/view_model/main_model.dart';

void main() => runApp(TikTokClone());

class TikTokClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainModel>(create: (_) => MainModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
