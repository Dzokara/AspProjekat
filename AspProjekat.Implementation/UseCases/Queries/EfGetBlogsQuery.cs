using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Queries
{
    public class EfGetBlogsQuery : EfUseCase, IGetBlogsQuery
    {
        public EfGetBlogsQuery(AspContext context) : base(context)
        {
        }

        public int Id => 2;

        public string Name => "Search Blogs";

        public PagedResponse<BlogDto> Execute(PagedSearch search)
        {
            var query = Context.Blogs.AsQueryable();

            int totalCount = query.Count();

            int perPage = search.PerPage.HasValue ? (int)Math.Abs((double)search.PerPage) : 10;
            int page = search.Page.HasValue ? (int)Math.Abs((double)search.Page) : 1;

            int skip = perPage * (page - 1);

            query = query.Where(x => x.IsActive);

            query = query.Skip(skip).Take(perPage);

            return new PagedResponse<BlogDto>
            {
                CurrentPage = page,
                Data = query.Select(x => new BlogDto
                {
                    Id = x.Id,
                    Title = x.Title,
                    Description = x.Description,
                    Image = x.Image.Path,
                    Date = x.CreatedAt,
                    Comments = x.Comments.Select(c => new CommentDto
                    {
                        AuthorId = c.AuthorId,
                        Text = c.Text,
                        BlogId = c.BlogId,
                    }).ToList()
                }).ToList(),
                PerPage = perPage,
                TotalCount = totalCount,
            };
        }
    }
}