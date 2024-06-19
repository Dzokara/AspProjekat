using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class CreateJobDto
    {
        public int PositionId { get; set; }
        public int CompanyId { get; set; }
        public IEnumerable<int> TechnologyIds { get; set; }
        public int RegionId { get; set; }
        public int TypeId { get; set; }
        public string Description { get; set; }
        public decimal Salary { get; set; }
        public IEnumerable<int> BenefitIds { get; set; }
        public IEnumerable<int> CategoryIds { get; set; }
        public DateTime Deadline { get; set; }
        public int RemoteId { get; set; }
    }
}
