using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Blog : Entity
    {
        public int ImageId { get; set; }
        public string Title { get; set; }

        public string Description { get; set; }

        public BlogImage Image { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
    }
}
