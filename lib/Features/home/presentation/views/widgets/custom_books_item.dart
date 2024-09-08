import 'package:bookly/Core/GlobalSharedWidget/custom_loadingIndicator.dart';
import 'package:bookly/Features/home/data/model/BookModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_routers.dart';

class CustomBooksItem extends StatelessWidget {
  const CustomBooksItem({Key? key, required this.imageUrl, required this.bookModel}) : super(key: key);
  final String imageUrl;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: ClipRRect(
        //ويدجيت تقدر تحطها فوق اي ويدجيت تانية عشان تعملها قص ع قد radius بتاعك
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            //باكدج بتكيشلك الصور اللي جاية من النت بشكل محترم وكمان تقدر من خلالها تحط حاجة وقت التحميل بتاع الصورة وكمان لو الصورة جات ب ايرور تقدر تحط ويدجيت تتعمل في حالة الايرور
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
           // placeholder: (context, url) => const CustomLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
