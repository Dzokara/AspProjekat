using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Position : NamedEntity
    {
        public virtual ICollection<Job> Jobs { get; set; } = new HashSet<Job>();
    }
}
