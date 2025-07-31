import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/app_bars/recipe_app_bar_main.dart';
import '../../common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import '../managers/categories_view_model.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(),
      builder: (context, child) => Consumer<CategoriesViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBarMain(title: "Categories"),
            body: switch (vm.isCategoriesLoading) {
              true => Center(child: CircularProgressIndicator()),
              false => GridView.builder(
                padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 39.w,
                  mainAxisSpacing: 8.h,
                  mainAxisExtent: 172.h,
                ),
                itemCount: vm.categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  id: vm.categories[index]["id"],
                  title: vm.categories[index]["title"],
                  image: vm.categories[index]["image"],
                ),
              ),
            },
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
