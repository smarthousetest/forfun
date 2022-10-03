class Model {
  Model({
    this.kind,
    this.data,
  });

  String? kind;
  ModelData? data;

  factory Model.fromJson(Map<String, dynamic> json) {
    print("fdf");
    return Model(
      kind: json["kind"],
      data: ModelData.fromJson(json['data']),
    );
  }
}

class ModelData {
  ModelData({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  String? after;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<Child>? children;
  dynamic? before;
  ModelData.fromJson(Map<String, dynamic> json) {
    after = json['after'];
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <Child>[];
      json['children'].forEach((v) {
        children!.add(new Child.fromJson(v));
      });
    }
    before = json['before'];
  }
}

class Child {
  Child({
    this.kind,
    this.data,
  });

  String? kind;
  ChildData? data;

  Child.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new ChildData.fromJson(json['data']) : null;
  }
}

class ChildData {
  ChildData({
    this.title,
    this.ups,
    this.thumbnail,
    this.id,
    this.selftext,
  });
  String? selftext;
  String? title;
  int? ups;
  String? thumbnail;
  String? id;

  ChildData.fromJson(Map<String, dynamic> json) {
    selftext = json['selftext'];
    ups = json['ups'];
    thumbnail = json['thumbnail'];
    id = json['id'];
    title = json['title'];
  }
}

enum AuthorFlairCssClass { NEW }

enum AuthorFlairTextColor { DARK }

enum FlairType { TEXT }

class Gildings {
  Gildings();
}

enum LinkFlairTextColor { LIGHT }

class Media {
  Media({
    this.type,
    this.oembed,
  });

  MediaType? type;
  Oembed? oembed;
}

class Oembed {
  Oembed({
    this.providerUrl,
    this.version,
    this.title,
    this.type,
    this.thumbnailWidth,
    this.height,
    this.width,
    this.html,
    this.authorName,
    this.providerName,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.authorUrl,
  });

  String? providerUrl;
  String? version;
  String? title;
  OembedType? type;
  int? thumbnailWidth;
  int? height;
  int? width;
  String? html;
  AuthorName? authorName;
  ProviderName? providerName;
  String? thumbnailUrl;
  int? thumbnailHeight;
  String? authorUrl;
}

enum AuthorName { YONI_ALEM, FLUTTER_COMMUNITY, CODING_LIFE }

enum ProviderName { YOU_TUBE }

enum OembedType { VIDEO }

enum MediaType { YOUTUBE_COM }

class MediaEmbed {
  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  String? content;
  int? width;
  bool? scrolling;
  int? height;
  String? mediaDomainUrl;
}

enum WhitelistStatus { ALL_ADS }

class PollData {
  PollData({
    this.predictionStatus,
    this.totalStakeAmount,
    this.votingEndTimestamp,
    this.options,
    this.voteUpdatesRemained,
    this.isPrediction,
    this.resolvedOptionId,
    this.userWonAmount,
    this.userSelection,
    this.totalVoteCount,
    this.tournamentId,
  });

  dynamic? predictionStatus;
  dynamic? totalStakeAmount;
  int? votingEndTimestamp;
  List<Option>? options;
  dynamic? voteUpdatesRemained;
  bool? isPrediction;
  dynamic? resolvedOptionId;
  dynamic? userWonAmount;
  dynamic? userSelection;
  int? totalVoteCount;
  dynamic? tournamentId;
}

class Option {
  Option({
    this.text,
    this.id,
  });

  String? text;
  String? id;
}

enum PostHint { SELF, RICH_VIDEO, LINK }

class Preview {
  Preview({
    this.images,
    this.enabled,
  });

  List<Image>? images;
  bool? enabled;
}

class Image {
  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  Source? source;
  List<Source>? resolutions;
  Gildings? variants;
  String? id;
}

class Source {
  Source({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;
}

enum Subreddit { FLUTTER_DEV }

enum SubredditId { T5_2_X3_Q8 }

enum SubredditNamePrefixed { R_FLUTTER_DEV }

enum SubredditType { PUBLIC }

enum Kind { T3 }

// class GetCards {
//   getCards() {
//     return """
// {"kind": "Listing", "data": {"after": "t3_xr2rtm", "dist": 25, "modhash": "", "geo_filter": "", "children": [{"kind": "t3", "data": {"approved_at_utc": null, "subreddit": "FlutterDev", "selftext": "", "author_fullname": "t2_hoark", "saved": false, "mod_reason_title": null, "gilded": 0, "clicked": false, "title": "Flutter Bottom Navigation Bar with Nested Routes using GoRouter vs Beamer: A Comparison", "link_flair_richtext": [], "subreddit_name_prefixed": "r/FlutterDev", "hidden": false, "pwls": 6, "link_flair_css_class": "", "downs": 0, "thumbnail_height": 78, "top_awarded_type": null, "hide_score": true, "name": "t3_xs19g9", "quarantine": false, "link_flair_text_color": "light", "upvote_ratio": 0.91, "author_flair_background_color": "", "ups": 8, "total_awards_received": 0, "media_embed": {}, "thumbnail_width": 140, "author_flair_template_id": null, "is_original_content": false, "user_reports": [], "secure_media": null, "is_reddit_media_domain": false, "is_meta": false, "category": null, "secure_media_embed": {}, "link_flair_text": "Article", "can_mod_post": false, "score": 8, "approved_by": null, "is_created_from_ads_ui": false, "author_premium": false, "thumbnail": "https://b.thumbs.redditmedia.com/-1UxfMPg2iQrcBH9H6xtW5nGastWSUh1Fv9YEX4q6iY.jpg", "edited": false, "author_flair_css_class": "new", "author_flair_richtext": [], "gildings": {}, "post_hint": "link", "content_categories": null, "is_self": false, "subreddit_type": "public", "created": 1664544198.0, "link_flair_type": "text", "wls": 6, "removed_by_category": null, "banned_by": null, "author_flair_type": "text", "domain": "codewithandrea.com", "allow_live_comments": false, "selftext_html": null, "likes": null, "suggested_sort": null, "banned_at_utc": null, "url_overridden_by_dest": "https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/", "view_count": null, "archived": false, "no_follow": false, "is_crosspostable": false, "pinned": false, "over_18": false, "preview": {"images": [{"source": {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?auto=webp&amp;s=2b803041d28ceb665ad922a7e1144064bb7a626d", "width": 1200, "height": 675}, "resolutions": [{"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=108&amp;crop=smart&amp;auto=webp&amp;s=af3c76d3c2ec6ce05dce662fb4f28daba4bde414", "width": 108, "height": 60}, {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=216&amp;crop=smart&amp;auto=webp&amp;s=77cff54268ef0728716fd871176a8ffa00520fab", "width": 216, "height": 121}, {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=320&amp;crop=smart&amp;auto=webp&amp;s=e0719bce0ca4073dc6af737de0521609c288c06c", "width": 320, "height": 180}, {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=640&amp;crop=smart&amp;auto=webp&amp;s=e54dc3c7fa51428bd5927d6475e82ab8c27f2879", "width": 640, "height": 360}, {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=960&amp;crop=smart&amp;auto=webp&amp;s=6ad458c490d958e4832c2d2ddd6b75b94a34847f", "width": 960, "height": 540}, {"url": "https://external-preview.redd.it/Z5oVs6AmwZ2El4e23jwNuMnwUdNVU_ZM7qKJTcIXCmw.jpg?width=1080&amp;crop=smart&amp;auto=webp&amp;s=cba90d4f54779f7914c3c24d30cccf4e4c0bc1c1", "width": 1080, "height": 607}], "variants": {}, "id": "V_Vk-nkwG3K2POmbjPeoU6e_0cUHxlw_EyRlTBJD1Bk"}], "enabled": false}, "all_awardings": [], "awarders": [], "media_only": false, "link_flair_template_id": "15d8d566-594c-11e8-9d1b-0e24dd4fb0ea", "can_gild": false, "spoiler": false, "locked": false, "author_flair_text": "", "treatment_tags": [], "visited": false, "removed_by": null, "mod_note": null, "distinguished": null, "subreddit_id": "t5_2x3q8", "author_is_blocked": false, "mod_reason_by": null, "num_reports": null, "removal_reason": null, "link_flair_background_color": "#006bbd", "id": "xs19g9", "is_robot_indexable": true, "report_reasons": null, "author": "bizz84", "discussion_type": null, "num_comments": 1, "send_replies": true, "whitelist_status": "all_ads", "contest_mode": false, "mod_reports": [], "author_patreon_flair": false, "author_flair_text_color": "dark", "permalink": "/r/FlutterDev/comments/xs19g9/flutter_bottom_navigation_bar_with_nested_routes/", "parent_whitelist_status": "all_ads", "stickied": false, "url": "https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/", "subreddit_subscribers": 97875, "created_utc": 1664544198.0, "num_crossposts": 0, "media": null, "is_video": false}}
// """;
//   }
// }
