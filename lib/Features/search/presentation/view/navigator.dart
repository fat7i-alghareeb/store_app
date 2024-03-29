import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Navigator/presentation/view/widgets/drawer%20widgets/drawer.dart';
import '../../../home/presentation/manger/products cubit/products_cubit.dart';
import '../../../home/presentation/view/home.dart';
import '../../../Cart/presentation/view/cart_screen.dart';
import '../../../../presentation/pages/page3.dart';
import '../../../Navigator/presentation/view/widgets/custom bottom bar.dart/bottom_nav.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const HomeScreen(),
    const CartScreen(),
    const Page3(),
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: CustomBottomBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
