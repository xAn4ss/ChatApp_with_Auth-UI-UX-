class Chat {
  final String name, image, lastMessage, time;
  final bool active;

  Chat({
    this.name = '',
    this.image = "",
    this.lastMessage = "",
    this.time = "",
    this.active = false,
  });
}

List chatsData = [
  Chat(
      name: 'Leila Hadya',
      image: 'assets/images/user_1.png',
      lastMessage: "Im doing fine, thanks...",
      time: "1m ago",
      active: true),
  Chat(
      name: 'David Frazier',
      image: 'assets/images/user_2.png',
      lastMessage: "Happy birthday to you..",
      time: "17m ago",
      active: false),
  Chat(
      name: 'Scarlet Estrada',
      image: 'assets/images/user_3.png',
      lastMessage:
          "Are u still intersted iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiin",
      time: "2hrs ago",
      active: false),
  Chat(
      name: 'Diana Nelson',
      image: 'assets/images/user_4.png',
      lastMessage: "Yesterday's party was lit...",
      time: "17:34",
      active: true),
  Chat(
      name: 'Judith Garcia',
      image: 'assets/images/user_5.png',
      lastMessage: "Yo, got some news for u...",
      time: "20:07",
      active: false),
  Chat(
      name: 'Kevin Moore',
      image: 'assets/images/user_6.png',
      lastMessage: "Have ",
      time: "01:45",
      active: true),
];
