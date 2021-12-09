import 'package:astra_app/enums/bottom_nav_bar_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BotomNavBarState> {
  BottomNavBarCubit()
      : super(
            const BotomNavBarState(selectedItem: BottomNavBarItem.favorite)) {}

  void updateSelectedItem(BottomNavBarItem item) {
    if (item != state.selectedItem) {
      emit(BotomNavBarState(selectedItem: item));
    }
  }
}