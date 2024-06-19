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
    public class EfGetJobsQuery : EfUseCase, IGetJobsQuery
    {
        public EfGetJobsQuery(AspContext context) : base(context)
        {
        }

        public int Id => 3;

        public string Name => "Search Users";

        public PagedResponse<JobDto> Execute(JobSearch search)
        {
            var query = Context.Jobs.AsQueryable();

            if (search.RegionId.HasValue)
            {
                query = query.Where(x => x.RegionId == search.RegionId);
            }
            if (search.TypeId.HasValue)
            {
                query = query.Where(x => x.TypeId == search.TypeId);
            }
            if (search.CompanyId.HasValue)
            {
                query = query.Where(x => x.CompanyId == search.CompanyId);
            }
            if (search.PositionId.HasValue)
            {
                query = query.Where(x => x.PositionId == search.PositionId);
            }
            if (search.Salary.HasValue)
            {
                query = query.Where(x => x.Salary >= search.Salary);
            }
            if (search.Benefits != null && search.Benefits.Any())
            {
                query = query.Where(x => x.Benefits.Any(b => search.Benefits.Contains(b.BenefitId)));
            }
            if (search.Technologies != null && search.Technologies.Any())
            {
                query = query.Where(x => x.Technology.Any(t=>search.Technologies.Contains(t.TechnologyId)));
            }
            if (search.RemoteId.HasValue)
            {
                query = query.Where(x=>x.RemoteId == search.RemoteId);
            }

            int totalCount = query.Count();

            int perPage = search.PerPage.HasValue ? (int)Math.Abs((double)search.PerPage) : 10;
            int page = search.Page.HasValue ? (int)Math.Abs((double)search.Page) : 1;

            int skip = perPage * (page - 1);

            query = query.Skip(skip).Take(perPage);

            return new PagedResponse<JobDto>
            {
                CurrentPage = page,
                Data = query.Select(x => new JobDto
                {
                    Id = x.Id,
                    Position = x.Position.Name,
                    Company = x.Company.Name,
                    Technology = x.Technology.Select(t => new TechnologyDto
                    {
                        Id = t.TechnologyId,
                        Name = t.Technology.Name
                    }).ToList(),
                    Region = x.Region.Name,
                    Type = x.Type.Name,
                    Description = x.Description,
                    Salary = x.Salary,
                    Benefits = x.Benefits.Select(b => new BenefitDto
                    {
                        Id = b.BenefitId,
                        Name = b.Benefit.Name
                    }).ToList(),
                    Deadline = x.Deadline,
                    Remote = x.Remote.Name

                }).ToList(),
                PerPage = perPage,
                TotalCount = totalCount,
            };
        }
    }
}
