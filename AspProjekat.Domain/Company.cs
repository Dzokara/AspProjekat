using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Company : NamedEntity
    {
        public int ImageId { get; set; }
        public string Description { get; set; }

        public virtual CompanyImage Image { get; set; }

        public virtual ICollection<Job> Jobs { get; set; } = new HashSet<Job>();
    }
}
