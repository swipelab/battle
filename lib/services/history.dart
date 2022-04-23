import 'package:flutter/widgets.dart';

class History extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  History(Page root)
      : _navigatorKey = GlobalKey<NavigatorState>(),
        _root = root,
        _pages = [];

  final Page _root;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        _root,
        ..._pages,
      ],
      onPopPage: _handlePop,
    );
  }

  final List<Page> _pages;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {
    // skip
  }

  bool _handlePop(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;
    return _pages.remove(route.settings);
  }

  void openPage(Page page) {
    _pages.add(page);
    notifyListeners();
  }
}
