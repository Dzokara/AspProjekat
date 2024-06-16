using AspProjekat.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.DataAccess.Configurations
{
    internal class TestimonialConfiguration : EntityConfiguration<Testimonial>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Testimonial> builder)
        {
            builder.Property(x => x.Text).IsRequired().HasMaxLength(500);

        }
    }
}
