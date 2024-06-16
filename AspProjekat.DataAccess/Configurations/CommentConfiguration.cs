using AspProjekat.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.DataAccess.Configurations
{
    internal class CommentConfiguration : EntityConfiguration<Comment>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x=>x.Text).IsRequired().HasMaxLength(500);
        }
    }
}
