class Lobby {
  Lobby({
    required this.id,
    required this.name,
    required this.isLocked,
    required this.maxPlayers,
  });

  final String id;
  final String name;
  final bool isLocked;
  final int maxPlayers;
}
