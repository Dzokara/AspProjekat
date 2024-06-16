using AspProjekat.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.DataAccess.Configurations
{
    internal class BlogConfiguration : EntityConfiguration<Blog>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Blog> builder)
        {
            builder.Property(x => x.Title).IsRequired();

            builder.Property(x=>x.Description).IsRequired();

            builder.HasMany(x=>x.Comments).WithOne(x=>x.Blog).HasForeignKey(x=>x.BlogId).OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x=>x.Image).WithMany(x=>x.Blog).HasForeignKey(x=>x.ImageId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
