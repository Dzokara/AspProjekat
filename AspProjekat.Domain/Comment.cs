using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Comment : Entity
    {
        public virtual int BlogId { get; set; }
        public string Text { get; set; }

        public int AuthorId { get; set; }

        public virtual Blog Blog { get; set; }

        public virtual User Author { get; set; }
    }
}
