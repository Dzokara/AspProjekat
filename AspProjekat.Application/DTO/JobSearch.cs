using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class JobSearch : PagedSearch
    {
        public int? RegionId { get; set; }
        public int? TypeId { get; set; }

        public int? CompanyId { get; set; }

        public int? PositionId { get; set; }

        public decimal? Salary { get; set; }

        public IEnumerable<BenefitDto>? Benefits { get; set; } 

        public IEnumerable<TechnologyDto>? Technologies { get; set; }

        public IEnumerable<CategoryDto>? Categories { get; set; }

        public int? RemoteId { get; set; }
    }
}
