import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_filled_button.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_icon_button.dart';
import 'package:recipe/features/onboarding/managers/cuisines_view_model.dart';
import 'package:recipe/features/onboarding/widgets/cuisine_item.dart';
import 'package:recipe/features/onboarding/widgets/onboarding_page_indicator.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisinesViewModel(),
      builder: (context, child) => Consumer<CuisinesViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              leading: RecipeIconButton(
                icon: 'assets/icons/back-arrow.svg',
                onPressed: () {},
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.redPinkMain,
              ),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 37.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OnboardingPageIndicator(),
                    SizedBox(height: 55.h),
                    Expanded(
                      child: Column(
                        spacing: 20.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select your cuisines preferences",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 20.r,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Please select your cuisines preferences for a better recommendations or you can skip it.",
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 13.r,
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: 126.h,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w,
                                  ),
                              itemCount: vm.cuisines.length,
                              itemBuilder: (context, index) => CuisineItem(
                                id: vm.cuisines[index]['id'],
                                title: vm.cuisines[index]['title'],
                                image: vm.cuisines[index]['image'],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60.h),
                      child: Row(
                        spacing: 32.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RecipeFilledButton(
                            text: "Skip",
                            size: Size(162.w, 45.h),
                            foregroundColor: AppColors.pinkSub,
                            backgroundColor: AppColors.pink,
                            onPressed: () {},
                          ),
                          RecipeFilledButton(
                            text: "Continue",
                            onPressed: () {},
                            size: Size(162.w, 45.h),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
