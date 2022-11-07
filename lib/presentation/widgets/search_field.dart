import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_bright/constants/form_field_styles.dart';
import 'package:sun_bright/constants/text_style.dart';
import 'package:sun_bright/presentation/bloc/search/search_bloc.dart';
import 'package:sun_bright/presentation/screens/search/search_screen.dart';

import '../../data/models/product.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // To prevent open the keyboard
        readOnly: true,
        showCursor: true,
        maxLines: 1,
        style: kSearchFieldTextStyle,
        onTap: () {
          showProductSearchDelegate<Product>(
              context: context,
              delegate: ProductSearchDelegate(
                  productBloc: BlocProvider.of<SearchBloc>(context)));
        },
        decoration: searchFieldInputDecoration);
  }
}
