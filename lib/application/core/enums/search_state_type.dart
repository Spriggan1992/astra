/// Enumeration of search screen loading states.
enum SearchStateType {
  /// Initial state.
  initial,

  /// Error state, except for [noInternetConnection] and [unexpectedError].
  failure,

  /// Data successfully received from the server.
  success,

  /// User has empty balance.
  emptyBalance,
}
