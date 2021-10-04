class Routes {
  static hotelPath(hotleSlug) {
    return `/hotel/${hotleSlug}`;
  }

  static hotelComparePath(slug) {
    return `/hotel/${slug}/compare`;
  }

  static comparePath(slugs) {
    return `/comparisons?hotels=${slugs}`;
  }
}

export default Routes;