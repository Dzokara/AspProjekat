using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Technology : NamedEntity
    {

        public virtual ICollection<JobTechnology> Jobs { get; set; } = new HashSet<JobTechnology>();    
    }
}
