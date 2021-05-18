import 'package:app_hero/HeroModel.dart';
import 'package:app_hero/HeroesController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroesController>.value(
          value: HeroesController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hero APP",
        theme: ThemeData(primarySwatch: Colors.red),
        home: HeroWidget(),
      ),
    );
  }
}

class HeroWidget extends StatefulWidget {
  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListView.builder(
        itemCount: heroesController.heroes.length,
        itemBuilder: (context, index) {
          return _buildItem(heroesController.heroes[index]);
        });
  }

  _buildItem(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        model.isChecking(model);
        heroesController.notifyListeners();
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(Icons.star, color: Colors.yellow)
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero List"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
                child: Text(
                    "fav: ${heroesController.heroes.where((i) => i.isFavorite).length}"));
          },
        ),
      ),
      body: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
        return _buildList();
      }),
    );
  }
}
