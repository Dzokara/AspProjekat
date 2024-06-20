using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Queries
{
    public class EfGetSingleBlogQuery : EfUseCase, IGetSingleBlogQuery
    {
        public EfGetSingleBlogQuery(AspContext context) : base(context)
        {
        }

        public int Id => 3;

        public string Name => "Single blog";

        public BlogDto Execute(int id)
        {
            var blog = Context.Blogs
                .Where(x => x.IsActive && x.Id == id)
                .Select(x => new BlogDto
                {
                    Id = x.Id,
                    Title = x.Title,
                    Description = x.Description,
                    Image = x.Image.Path,
                    Comments = x.Comments.Select(c => new CommentDto
                    {
                        AuthorId = c.AuthorId,
                        Text = c.Text,
                        BlogId = c.BlogId
                    }).ToList()
                })
                .FirstOrDefault();

            return blog;
        }
    }
}
