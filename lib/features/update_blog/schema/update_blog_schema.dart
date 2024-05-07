class UpdateBlogPostSchema {
  static String updateblogpostJson = r"""
  
  mutation($blogId: String!, $title: String!, $subTitle: String!, $body: String! ) {
  updateBlog(blogId: $blogId, title: $title, subTitle: $subTitle, body: $body) {
    token
    
  }
}


  """;
}