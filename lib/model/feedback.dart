class Feed {
  final String feed;
  final String subject;
  final String teename;
  final double rate;
  Feed({this.feed, this.subject, this.teename, this.rate});

  Map<String, String> toMap() =>
      {'fd': this.feed, 'sb': this.subject, 'tn': this.teename};

  Feed.fromMap(Map<String, String> map)
      : feed = map['fd'].toString(),
        subject = map['sb'].toString(),
        teename = map['tn'].toString(),
        rate = double.parse(map['rt'].toString());
}

List<Feed> extractFeed(var feedbackMap) {
  List<Feed> feedData = new List(feedbackMap.length);
  for (int i = 0; i < feedbackMap.length; i++) {
    feedData[i] = Feed(
        feed: feedbackMap[i]['fd'].toString(),
        subject: feedbackMap[i]['sb'].toString(),
        teename: feedbackMap[i]['tn'].toString(),
        rate: double.parse(feedbackMap[i]['rt'].toString()));
  }

  return feedData;
}

class FeedList {
  List<dynamic> fdb = [];

  FeedList({
    this.fdb,
  });

  Map<String, dynamic> toMap() => {
        "fdb": this.fdb,
      };

  // FeedList.fromMap(Map<dynamic, dynamic> map)
  //     : fdb = map['feed'].map((fd) {
  //         return Feed.fromMap(fd);
  //       }).toList();
}
