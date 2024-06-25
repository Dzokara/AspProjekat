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
    public class EfGetTestimonialsQuery : EfUseCase, IGetTestimonialsQuery
    {
        public EfGetTestimonialsQuery(AspContext context) : base(context)
        {
        }

        public int Id => 2;

        public string Name => "Search Testimonials";

        public PagedResponse<TestimonialDto> Execute(PagedSearch search)
        {
            var query = Context.Testimonials.AsQueryable();

            int totalCount = query.Count();

            int perPage = search.PerPage.HasValue ? (int)Math.Abs((double)search.PerPage) : 10;
            int page = search.Page.HasValue ? (int)Math.Abs((double)search.Page) : 1;

            int skip = perPage * (page - 1);

            query = query.Where(x => x.IsActive);

            query = query.Skip(skip).Take(perPage);

            return new PagedResponse<TestimonialDto>
            {
                CurrentPage = page,
                Data = query.Select(x => new TestimonialDto
                {
                    Id = x.Id,
                    Text = x.Text,
                    UserId = x.UserId
                }).ToList(),
                PerPage = perPage,
                TotalCount = totalCount,
            };
        }
    }
}
