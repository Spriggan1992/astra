/// Manages states of the SearchActionBloc
enum SearchActionType {
  /// Applicant will be putted to category `Ваши лайки`.
  liked,

  /// Applicant will be blocked.
  blocked,

  /// Applicant will be putted to category `Стоп лист`.
  rejected,

  /// Applicant will be putted to category `Подумать`.
  thought,

  ///  User has not done anything yet.
  unknown,
}
