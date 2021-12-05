import 'package:astra_app/enums/bottom_nav_bar_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BotomNavBarCubit extends Cubit<BotomNavBarState> {
  BotomNavBarCubit()
      : super(
            const BotomNavBarState(selectedItem: BottomNavBarItem.favorite)) {}

  void updateSelectedItem(BottomNavBarItem item) {
    if (item != state.selectedItem) {
      emit(BotomNavBarState(selectedItem: item));
    }
  }
}
