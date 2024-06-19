using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class CreateBlogDto
    {
        public string Title { get; set; }

        public string Description { get; set; }

        public IFormFile Image { get; set; }
    }
}
