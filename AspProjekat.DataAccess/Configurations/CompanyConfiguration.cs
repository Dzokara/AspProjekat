using AspProjekat.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.DataAccess.Configurations
{
    internal class CompanyConfiguration : EntityConfiguration<Company>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Company> builder)
        {
            builder.Property(x=>x.Description).IsRequired();

            builder.HasOne(x=>x.Image).WithMany(x=>x.Company).HasForeignKey(x=>x.ImageId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
