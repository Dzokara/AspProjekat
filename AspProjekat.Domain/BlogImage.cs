using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class BlogImage : Image
    {
        public virtual ICollection<Blog> Blog { get; set; } = new HashSet<Blog>();
    }
}
