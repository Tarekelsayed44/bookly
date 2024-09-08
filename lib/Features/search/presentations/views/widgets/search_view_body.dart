import 'package:bookly/Features/search/presentations/views/widgets/search_Results_listView.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'custom_search_textField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Search Results',
              style: Styles.textStyle18,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: SearchResultListView(),),

          ],
        ),
      ),
    );
  }
}


