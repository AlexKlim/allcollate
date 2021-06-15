class Routes {
  static hotelPath(hotleSlug) {
    return `/hotel/${hotleSlug}`;
  }

  static comparePath(slugs) {
    return `/comparisons?hotels=${slugs}`;
  }
}

export default Routes;