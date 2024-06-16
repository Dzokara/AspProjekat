using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Testimonial : Entity
    {

        public int UserId {  get; set; }
        public string Text { get; set; }

        public virtual User User { get; set; }
    }
}
