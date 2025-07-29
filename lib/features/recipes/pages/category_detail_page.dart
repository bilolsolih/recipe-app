import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/client.dart';
import 'package:recipe/features/common/widgets/app_bars/recipe_app_bar_bottom.dart';
import 'package:recipe/features/recipes/widgets/recipe_item/recipe_item.dart';

import '../../common/widgets/app_bars/recipe_app_bar_main.dart';
import '../../common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';

Future<List> fetchRecipes({required int categoryId}) async {
  var response = await dio.get('/recipes/list?Category=$categoryId');
  if (response.statusCode != 200) {
    throw Exception("Ritseplarni olib kelishda xatolik: ${response.data}");
  }
  return response.data;
}

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchRecipes(categoryId: categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text(snapshot.error.toString())));
        } else if (snapshot.hasData) {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBarMain(
              toolbarHeight: 75.h,
              title: title,
              bottom: RecipeAppBarBottom(selectedIndex: categoryId),
            ),
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19.w,
                mainAxisSpacing: 30.h,
                mainAxisExtent: 226.h,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => RecipeItem(recipe: snapshot.data![index]),
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        } else {
          return Scaffold(body: Center(child: Text("Something went horribly wrong...")));
        }
      },
    );
  }
}
