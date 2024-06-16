using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class Job : Entity
    {
        public int RegionId { get; set; }
        public int TypeId { get; set; }
        public int RemoteId { get; set; }
        public int CompanyId { get; set; }
        public int PositionId { get; set; }

        public string Description { get; set; }

        public decimal Salary { get; set; }

        public DateTime Deadline { get; set; }

        public virtual Region Region { get; set; }

        public virtual Type Type { get; set; }

        public virtual ICollection<Category> Categories { get; set; } = new HashSet<Category>();

        public virtual Remote Remote{ get; set; }

        public virtual Company Company { get; set; }

        public virtual Position Position { get; set; } 

        public virtual ICollection<Benefit> Benefits { get; set; } = new HashSet<Benefit>();

        public virtual ICollection<Technology> Technology { get; set; } = new HashSet<Technology>();

        public virtual ICollection<User> SavedUsers {  get; set; }  = new HashSet<User>();  

    }
}
