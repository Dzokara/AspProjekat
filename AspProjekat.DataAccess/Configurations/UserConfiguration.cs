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
    internal class UserConfiguration : EntityConfiguration<User>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.Email)
                   .HasMaxLength(60)
                   .IsRequired();
            builder.HasIndex(x => x.Email)
                   .IsUnique();

            builder.Property(x => x.Username)
                   .HasMaxLength(20)
                   .IsRequired();
            builder.HasIndex(x => x.Username)
                   .IsUnique();

            builder.Property(x => x.FirstName)
                   .HasMaxLength(20);

            builder.Property(x => x.LastName)
                   .HasMaxLength(50);

            builder.Property(x => x.Password)
                   .IsRequired()
                   .HasMaxLength(120);

            builder.HasMany(x => x.SavedJobs)
                   .WithMany(x => x.SavedUsers);
               
            builder.HasMany(x=>x.Comments).WithOne(x=>x.Author).HasForeignKey(x=>x.AuthorId).OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x=>x.Testimonials).WithOne(x=>x.User).HasForeignKey(x=>x.UserId).OnDelete(DeleteBehavior.Restrict);


        }
    }
}
