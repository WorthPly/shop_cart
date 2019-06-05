class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Find the amazing people around you.', category: ' ', imageUrl: 'assets/1.jpg',),
  new IntroItem(title: 'To connect with perfect match just swipe.', category: ' ', imageUrl: 'assets/2.jpg',),
  new IntroItem(title: 'Only matches can talk with each other.', category: ' ', imageUrl: 'assets/3.jpg',),
];