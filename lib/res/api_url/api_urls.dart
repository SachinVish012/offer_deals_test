class AppApiURL{
  static const headers_value="08b4260e5585f282d1bd9d085e743fd9";
  static const headers_key='X-Desidime-Client';

  //-------app-URL
  static const top_dealsAPI="http://stagingauth.desidime.com/v4/home/new?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}";
  static const popular_featuredAPI="http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}";
}