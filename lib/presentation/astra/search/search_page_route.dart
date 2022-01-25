import 'package:astra_app/application/search/search_bloc.dart';
import 'package:astra_app/application/search/search_state_type.dart';
import 'package:astra_app/presentation/astra/search/search_screen.dart';
import 'package:astra_app/presentation/core/widgets/custom/platform.activity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageRoute extends StatelessWidget {
  const SearchPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.stateType == SearchStateType.initial) {
            return const Scaffold(body:  Center(child: PlatformActivityIndicator()));
          } else if (state.stateType == SearchStateType.success) {
            return SearchScreen(applicants: state.applicants);
          } else {
            return Scaffold(body: Text(state.errorMessage));
          }
        },
      
    );
  }
}
