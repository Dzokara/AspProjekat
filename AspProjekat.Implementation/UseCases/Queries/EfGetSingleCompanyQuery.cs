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
    public class EfGetSingleCompanyQuery : EfUseCase, IGetSingleCompanyQuery
    {
        public EfGetSingleCompanyQuery(AspContext context) : base(context)
        {
        }

        public int Id => 3;

        public string Name => "Single company";

        public CompanyDto Execute(int id)
        {
            var company = Context.Companies
                .Where(x => x.IsActive && x.Id == id)
                .Select(x => new CompanyDto
                {
                    Id = x.Id,
                    Name = x.Name,
                    Description = x.Description,
                    Image = x.Image.Path
                })
                .FirstOrDefault();

            return company;
        }
    }
}
