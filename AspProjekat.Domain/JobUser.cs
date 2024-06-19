using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class JobUser
    {
        public int UserId { get; set; }
        public int JobId { get; set; }

        public virtual Job Job { get; set; }

        public virtual User User { get; set; }

        public DateTime Time {  get; set; }
    }
}
