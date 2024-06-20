using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Benefit : NamedEntity
    {
        public virtual ICollection<BenefitJob> Jobs { get; set; } = new HashSet<BenefitJob>();
    }
}
