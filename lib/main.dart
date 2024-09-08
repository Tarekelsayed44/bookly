
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/utils/app_routers.dart';
import 'Core/utils/service_locator.dart';
import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'constants.dart';
void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(), //استحدام باكدج الجيت ات اللي بتعمل سينجلتون سيرفس
          )..fetchFeaturedBooks(), // هنا بقوله بعد م تشغل البلوك دا نفذلي الميثود دي بعده علطول ودي الميثود اللي هتعرضلي البيانات بتاعتي ودا مكان استدعائها السليم لانها مش معتمده ع زرار ولا اي حاجة تشغلها يبقا لازم اول م البلوك بتاعها يشتغل ف الهوم تطبقه وتنفذها ع طول
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(), //استحدام باكدج الجيت ات اللي بتعمل سينجلتون سيرفس
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark()
              .textTheme), //  الديفولت بتاع الخط انه ف اللايت ثيم عشان كدا هتلاقية بالاسود ميعرفش اني مستخدم الدارك مود ف لازم اعرفه بالطريقة دي وكدا هيطبق ع الابلكيشن كله
        ),
      ),
    );
  }
}
