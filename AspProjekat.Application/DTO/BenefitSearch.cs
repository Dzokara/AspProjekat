﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class BenefitSearch : PagedSearch
    {
        public string? Keyword { get; set; }
    }
}
