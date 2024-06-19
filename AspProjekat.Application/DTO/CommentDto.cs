using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.DTO
{
    public class CommentDto
    {
        public int AuthorId { get; set; }
        public int BlogId { get; set; }

        public string Text { get; set; }
    }
}
