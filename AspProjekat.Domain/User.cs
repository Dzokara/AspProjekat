using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Domain
{
    public class User : Entity
    {
        public string Email { get; set; }

        public string Password { get; set; }

        public string Username { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();

        public virtual ICollection<UserUseCase> UseCases { get; set; } = new HashSet<UserUseCase>();

        public virtual ICollection<JobUser> SavedJobs { get; set; } = new HashSet<JobUser>();

        public virtual ICollection<Testimonial> Testimonials { get; set; } = new HashSet<Testimonial>();

    }
}
