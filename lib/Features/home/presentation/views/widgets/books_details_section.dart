import 'package:bookly/Features/home/data/model/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'book_rating.dart';
import 'books_cost_button.dart';
import 'custom_books_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel})
      : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.25,
          ),
          child: SizedBox(
            height: size.height * 0.3,
            child: CustomBooksItem(
              bookModel: bookModel,
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? 'Unknown',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0.0,
          ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksCostButtons(bookModel: bookModel,),
      ],
    );
  }
}
