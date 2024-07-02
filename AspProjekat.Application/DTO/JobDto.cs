using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class JobDto 
    {
        public int Id { get; set; } 
        public PositionDto Position { get; set; }

        public CompanyDto Company { get; set; }

        public IEnumerable<TechnologyDto> Technologies { get; set; }

        public RegionDto Region { get; set; }
        public TypeDto Type { get; set; }

        public string Description { get; set; }

        public decimal Salary { get; set; }

        public IEnumerable<BenefitDto> Benefits { get; set; }

        public IEnumerable<CategoryDto> Categories { get; set; }

        public DateTime Deadline { get; set; }

        public RemoteDto Remote { get; set; }
    }
}
