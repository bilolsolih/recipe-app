import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/client.dart';

import '../../common/widgets/app_bars/recipe_app_bar_main.dart';
import '../../common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import '../widgets/category_item.dart';

Future<List> fetchCategories() async {
  var response = await dio.get('/categories/list');
  if (response.statusCode != 200) {
    throw Exception("Kategoriyalarni olib kelishda xatolik: ${response.data}");
  }
  return response.data;
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text(snapshot.error.toString())));
        } else if (snapshot.hasData) {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBarMain(title: "Categories"),
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 39.w,
                mainAxisSpacing: 8.h,
                mainAxisExtent: 172.h,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CategoryItem(
                id: snapshot.data![index]["id"],
                title: snapshot.data![index]["title"],
                image: snapshot.data![index]["image"],
              ),
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        } else {
          return Scaffold(
            body: Center(child: Text("Something went horribly wrong...")),
          );
        }
      },
    );
  }
}
