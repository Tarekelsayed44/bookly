import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_ListView.dart';
import 'custom_app_bar.dart';
import 'listView_books.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // ويدجيت حلوة لحل معضلة لو انت عندك نيستيد ليست فيو وعاوز اليو اي كله يسكرول
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          //نوع من انواع السليفيرز له طول محدد ع قد الشايلد اللي جواه
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              ListViewBooks(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          //دا مش زي اللي فوق عشان من الاخر اللي فوق له اخر بيبني الطفل بتاعه كامل بطول محدد انما دا بيبنيه كأنه بيتمدد وبياخد جواه اي ويجيت بت Expanded عادي ف دا عشان احنا الليست دي هتبقا اخر حاجة ف الشاشة ف بقوله تمدد براحتك بقا وخد الشاشة كلها
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
