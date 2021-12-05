part of 'bottom_nav_bar_cubit.dart';

class BotomNavBarState extends Equatable {
  final BottomNavBarItem selectedItem;
  const BotomNavBarState({
    required this.selectedItem,
  });

  BotomNavBarState copyWith({
    BottomNavBarItem? selectedItem,
  }) {
    return BotomNavBarState(
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => [selectedItem];
}
