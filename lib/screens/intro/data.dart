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
  new IntroItem(title: 'Find the amazing people around you.', category: ' ', imageUrl: 'https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80',),
  new IntroItem(title: 'To connect with perfect match just swipe.', category: ' ', imageUrl: 'https://images.unsplash.com/photo-1499175898579-d743fea6e7dc?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',),
  new IntroItem(title: 'Only matches can talk with each other.', category: ' ', imageUrl: 'https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',),
];