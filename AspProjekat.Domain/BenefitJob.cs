using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class BenefitJob
    {
        public int BenefitId { get; set; }
        public int JobId { get; set; }

        public virtual Job Job { get; set; }

        public virtual Benefit Benefit { get; set; }

    }
}
