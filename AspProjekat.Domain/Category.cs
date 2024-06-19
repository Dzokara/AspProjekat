using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Category : NamedEntity
    {
        public virtual ICollection<CategoryJob> Jobs { get; set; } = new HashSet<CategoryJob>();
    }
}
