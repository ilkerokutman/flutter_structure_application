import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:flutter_structure_application/app/presentation/home/home_screen.dart';
import 'package:flutter_structure_application/app/presentation/item_add/add_screen.dart';
import 'package:flutter_structure_application/app/presentation/item_detail/item_detail_screen.dart';
import 'package:flutter_structure_application/app/presentation/item_list/item_list_screen.dart';
import 'package:flutter_structure_application/app/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

final List<GetPage> getPages = [
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.addItem, page: () => const AddItemScreen()),
  GetPage(name: Routes.itemList, page: () => const ItemListScreen()),
  GetPage(name: Routes.itemDetail, page: () => const ItemDetailScreen()),
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
];
