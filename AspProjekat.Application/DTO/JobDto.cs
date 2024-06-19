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
        public string Position { get; set; }

        public string Company { get; set; }

        public IEnumerable<TechnologyDto> Technologies { get; set; }

        public string Region { get; set; }
        public string Type { get; set; }

        public string Description { get; set; }

        public decimal Salary { get; set; }

        public IEnumerable<BenefitDto> Benefits { get; set; }

        public IEnumerable<CategoryDto> Categories { get; set; }

        public DateTime Deadline { get; set; }

        public string Remote { get; set; }
    }
}
