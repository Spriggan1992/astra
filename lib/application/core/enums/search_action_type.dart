
/// [SearchActionState] - manages states of the SearchActionBloc 
/// [liked] - user tapped like button.
/// [blocked] - user tapped block button, to block an applicant.
/// [rejected] - user tapped reject button.
/// [thought] - thought state.
/// [unknoun] - unknoun state. User has not done anything yet.
enum SearchActionType{
  liked,
  blocked,
  rejected,
  thought,
  unknoun, 
}