using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class UpdateCompanyDto
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Description { get; set; }

        public IFormFile? Image { get; set; }

        public bool isActive { get; set; }
    }
}
