import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/theme/theme_cubit.dart';
import 'package:template/core/widgets/scaffold_messenger.dart';
// TODO this page only for test, pls convert to clean arch :)

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Template'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [],
        ),
      ),
      floatingActionButton: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {
          scaffoldMessenger(context, state.themeEnum.name);
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
             if(state.themeEnum.name == ThemeEnum.light.name) {
               BlocProvider.of<ThemeCubit>(context).darkMode();
             } else {
               BlocProvider.of<ThemeCubit>(context).lightMode();
             }
            },
            child: const Icon(Icons.theater_comedy),
          );
        },
      ),
    );
  }
}
