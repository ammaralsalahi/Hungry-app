import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/featuers/home/widgts/card_item.dart';
import 'package:hungry/featuers/home/widgts/food_catagory.dart';
import 'package:hungry/featuers/home/widgts/search_filled.dart';
import 'package:hungry/featuers/home/widgts/user_header.dart';
import 'package:hungry/featuers/products/viwes/proproduct_detiles_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List catageory = [
    "All",
    "combo",
    "sliders",
    "fast food",
    "snacks",
    "drinks",
    "desserts",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 👇 لإغلاق الكيبورد عند الضغط على أي مكان فارغ في الشاشة
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        ///CustomScrollView هو ودجت خاصة بالتمرير (Scrolling)
        // تمكّنك من دمج عدّة أجزاء مختلفة قابلة للتمرير داخل شاشة واحدة.

        // تخيّلها مثل “قائمة مخصّصة” فيها أكثر من نوع من المحتوى:
        // مثلاً: AppBar متحرك، قسم ثابت، قائمة منتجات، شبكة صور… إلخ.

        // كل قسم من هذه الأقسام يسمى Sliver.

        // 🧩 ثانيًا: ما هي الـ Slivers ؟

        // كلمة Sliver تعني “قطعة رفيعة” أو “جزء صغير”.
        // في Flutter، الـ Sliver هي “جزء من واجهة يمكن تمريرها داخل CustomScrollView”.

        // كل Sliver تعرف كيف يتم رسمها وسلوكها عند التمرير.
        // بالتالي، CustomScrollView = مجموعة Slivers تتحرك معًا.

        // ⚙️ ثالثًا: كيف تعمل CustomScrollView من الداخل؟

        // عند تمرير الصفحة:

        // Flutter لا يقوم برسم كل شيء دفعة واحدة.

        // بل يقوم برسم الـ Sliver الظاهرة فقط على الشاشة.

        // هذا يجعل الأداء أسرع جدًا (خاصة عند القوائم الكبيرة).

        // ببساطة، الـ CustomScrollView:

        // يأخذ قائمة من الـ Slivers.

        // يضعها فوق بعض.

        // يجعلها كلها قابلة للتمرير معًا.
        body: CustomScrollView(
          slivers: [
            // header
            SliverAppBar(
              pinned: true,
              elevation: 0,
              floating: true,
              backgroundColor: Colors.white,
              toolbarHeight: 155, // Slightly taller if needed
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [UserHeader(), Gap(10), SearchFilled()],
                ),
              ),
            ),

            // category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 20,
                ),
                child: FoodCategory(
                  selectedIndex: selectedIndex,
                  catageory: catageory,
                ),
              ),
            ),

            ///gridview bulider
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProproductDetilesView(),
                        ),
                      );
                    },
                    child: CardItem(
                      image: "assets/test/test.png",
                      text: "chicken burger",
                      desc: "lorem ipsum dolor sit amet",
                      rate: " 4.9",
                    ),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
