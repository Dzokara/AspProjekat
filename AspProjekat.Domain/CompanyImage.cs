using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class CompanyImage : Image
    {
        public virtual ICollection<Company> Company { get; set; } = new HashSet<Company>();
    }
}
