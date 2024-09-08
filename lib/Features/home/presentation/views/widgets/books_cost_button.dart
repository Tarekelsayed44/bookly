import 'package:bookly/Features/home/data/model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/GlobalSharedWidget/custom_button.dart';
import '../../../../../Core/utils/functions/lunch_url.dart';

class BooksCostButtons extends StatelessWidget {
  const BooksCostButtons({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children:  [
         const Expanded(
              child: CustomButton(
                text: 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12), bottomLeft: Radius.circular(16)),
              )),
          Expanded(
              child: CustomButton(
                onPressed: (){
                  launchCustomUr(context, bookModel.volumeInfo.previewLink!);
                },
                text: getText(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                fontSize: 16,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12), bottomRight: Radius.circular(16)),
              )),
        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Available';
    } else{
      return 'Preview';
    }

 }
}
