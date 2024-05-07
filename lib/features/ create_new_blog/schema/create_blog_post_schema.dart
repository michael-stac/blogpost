class CreateBlogPostSchema {
  static String creatblogpostJson = r"""
  
  mutation($title: String!, $subTitle: String!, $body: String!, ) {
  createBlog(title: $title, subTitle: $subTitle, body: $body) {
    token
    
  }
}


  """;
}