import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Features/home/presentation/manger/products cubit/products_cubit.dart';
import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.of(context).size.height;
    //final x = MediaQuery.of(context).size.width;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: y / 10,
      centerTitle: false,
      elevation: 0,
      floating: true,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, searchScreen,
                    arguments:
                        BlocProvider.of<ProductsCubit>(context).products);
                HapticFeedback.heavyImpact();
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
                size: 32,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Image.asset(
                'images/menu.png',
                height: 32,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        )
      ],
    );
  }
}
