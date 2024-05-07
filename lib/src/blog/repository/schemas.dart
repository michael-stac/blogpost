
///blog schemas

const String fetchAllBlogsQuery = """
    query fetchAllBlogs {
      allBlogPosts {
        id
        title
        subTitle
        body
        dateCreated
      }
    }
  """;

/// create blog schema
const String createBlogMutation = r'''
  mutation createBlogPost($title: String!, $subTitle: String!, $body: String!) {
    createBlog(title: $title, subTitle: $subTitle, body: $body) {
      success
      blogPost {
        id
        title
        subTitle
        body
        dateCreated
      }
    }
  }
''';

///update blog schema
const String updateBlogMutation = r'''
  mutation updateBlog($blogId: String!, $title: String!, $subTitle: String!, $body: String!) {
    updateBlog(blogId: $blogId, title: $title, subTitle: $subTitle, body: $body) {
      success
      blogPost {
        id
        title
        subTitle
        body
        dateCreated
      }
    }
  }
''';




///deleter blog schema
const String deleteBlogMutation = r"""
  
  mutation deleteBlogPost($blogId: String!) {
  deleteBlog(blogId: $blogId) {
    success
  }
}

  """;
/// fetch single blog by id
const String fetchSingleBlogsByID = r"""
    query getBlog($blogId: String!) {
  blogPost(blogId: $blogId) {
    id
    title
    subTitle
    body
    dateCreated
  }
}
  """;


