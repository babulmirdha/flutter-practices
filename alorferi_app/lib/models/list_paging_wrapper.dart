class ListPagingWrapper<T> {
  final T list;
  final int current_page;
  final int last_page;

  ListPagingWrapper(
      {required this.list,
      required this.current_page,
      required this.last_page});
}
