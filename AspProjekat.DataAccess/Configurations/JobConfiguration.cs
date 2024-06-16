using AspProjekat.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AspProjekat.DataAccess.Configurations
{
    internal class JobConfiguration : EntityConfiguration<Job>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Job> builder)
        {
            builder.Property(x => x.Description)
                .IsRequired()
                .HasMaxLength(500);

            builder.Property(x => x.Salary)
                .IsRequired();

            builder.HasOne(x=>x.Region).WithMany(x => x.Jobs).HasForeignKey(x => x.RegionId).OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x=>x.Type).WithMany(x=>x.Jobs).HasForeignKey(x=>x.TypeId).OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x=>x.Company).WithMany(x=>x.Jobs).HasForeignKey(x=>x.CompanyId).OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x=>x.Position).WithMany(x=>x.Jobs).HasForeignKey(x=>x.PositionId).OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x=>x.Remote).WithMany(x=>x.Jobs).HasForeignKey(x=>x.RemoteId).OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Benefits).WithMany(x => x.Jobs);

            builder.HasMany(x => x.Categories).WithMany(x => x.Jobs);

            builder.HasMany(x => x.Technology).WithMany(x => x.Jobs);

            
           
        }
    }
}
