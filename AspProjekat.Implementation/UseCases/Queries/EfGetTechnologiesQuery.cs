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
    public class EfGetTechnologiesQuery : EfUseCase, IGetTechnologiesQuery
    {
        public EfGetTechnologiesQuery(AspContext context) : base(context)
        {
        }

        public int Id => 3;

        public string Name => "Search technologies";

        public PagedResponse<TechnologyDto> Execute(TechnologySearch search)
        {
            var query = Context.Technology.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                query = query.Where(x => x.Name.Contains(search.Keyword));
            }

            int totalCount = query.Count();

            int perPage = search.PerPage.HasValue ? (int)Math.Abs((double)search.PerPage) : 10;
            int page = search.Page.HasValue ? (int)Math.Abs((double)search.Page) : 1;

            int skip = perPage * (page - 1);

            query = query.Where(x => x.IsActive);

            query = query.Skip(skip).Take(perPage);

            return new PagedResponse<TechnologyDto>
            {
                CurrentPage = page,
                Data = query.Select(x => new TechnologyDto
                {
                    Id = x.Id,
                    Name = x.Name,
                }).ToList(),
                PerPage = perPage,
                TotalCount = totalCount,
            };
        }
    }
}
