using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace AspProjekat.Implementation.UseCases.Queries
{
    public class EfGetSingleJobQuery : EfUseCase, IGetSingleJobQuery
    {
        public EfGetSingleJobQuery(AspContext context) : base(context)
        {
        }

        public int Id => 2;

        public string Name => "Single job";

        public JobDto Execute(int id)
        {
            var job = Context.Jobs
                .Where(x => x.IsActive && x.Id == id)
                .Select(x => new JobDto
                {
                    Id = x.Id,
                    Position = new PositionDto
                    {
                        Id = x.PositionId,
                        Name = x.Position.Name
                    },
                    Company = new CompanyDto
                    {
                        Id=x.CompanyId,
                        Name = x.Company.Name,
                        Image = x.Company.Image.Path,
                        Description = x.Company.Description
                    },
                    Technologies = x.Technology.Select(t => new TechnologyDto
                    {
                        Id = t.TechnologyId,
                        Name = t.Technology.Name
                    }).ToList(),
                    Region = new RegionDto
                    {
                        Id = x.RegionId,
                        Name = x.Region.Name,
                    },
                    Type = new TypeDto
                    {
                        Id= x.TypeId,
                        Name = x.Type.Name
                    },
                    Description = x.Description,
                    Salary = x.Salary,
                    Benefits = x.Benefits.Select(b => new BenefitDto
                    {
                        Id = b.BenefitId,
                        Name = b.Benefit.Name
                    }).ToList(),
                    Categories = x.Categories.Select(b => new CategoryDto
                    {
                        Id = b.CategoryId,
                        Name = b.Category.Name
                    }).ToList(),
                    Deadline = x.Deadline,
                    Remote = new RemoteDto
                    {
                        Id = x.RemoteId,
                        Name = x.Remote.Name
                    }
                })
                .FirstOrDefault();

            return job;
        }
    }
}
