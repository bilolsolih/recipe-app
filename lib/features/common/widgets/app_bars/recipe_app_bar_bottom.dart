import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/client.dart';

import 'bottom_item.dart';

Future<List> fetchCategories() async {
  var response = await dio.get('/categories/list');
  if (response.statusCode != 200) {
    throw Exception('Kategoriyalarni olib kelishda xatolik.');
  }
  return response.data;
}

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Size get preferredSize => Size(double.infinity, 25.h);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 7.h),
              child: Row(
                spacing: 19.w,
                children: List.generate(
                  snapshot.data!.length,
                  (index) => BottomItem(
                    id: snapshot.data![index]['id'],
                    title: snapshot.data![index]['title'],
                    isSelected: snapshot.data![index]['id'] == selectedIndex,
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
