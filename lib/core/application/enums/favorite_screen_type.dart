/// Enumeration of the display category of the screen favorites.
enum FavoriteScreenType {
  /// Applicants that current user likes.
  yoursLikes,

  /// Applicants that likes current user.
  likesForYou,

  /// Applicants and current user like each other and already paid.
  match,

  /// Applicants that current user not sure and put them to `Подумать` category.
  think,

  /// Applicants that current user don't like.
  stopList,
}
