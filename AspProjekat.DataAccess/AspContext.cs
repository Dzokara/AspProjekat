using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AspProjekat.Domain;


namespace AspProjekat.DataAccess
{
    public class AspContext : DbContext
    {
        private readonly string _connectionString;
        public AspContext(string connectionString)
        {
            _connectionString = connectionString;
        }

        public AspContext()
        {
            _connectionString = "Data Source=DESKTOP-3UG95B9\\SQLEXPRESS;Initial Catalog=AspProjekat;TrustServerCertificate=true;Integrated security = true";
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_connectionString);

            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);

            modelBuilder.Entity<Job>().UseTptMappingStrategy();

            modelBuilder.Entity<UserUseCase>().HasKey(x => new
            {
                x.UserId,
                x.UseCaseId
            });

            modelBuilder.Entity<JobUser>()
                        .HasKey(x => new { x.JobId, x.UserId });

            modelBuilder.Entity<BenefitJob>()
                        .HasKey(x => new { x.BenefitId, x.JobId });
            modelBuilder.Entity<JobTechnology>()
                        .HasKey(x => new { x.JobId, x.TechnologyId });
            modelBuilder.Entity<CategoryJob>()
                        .HasKey(x => new { x.CategoryId, x.JobId });


            base.OnModelCreating(modelBuilder);
        }

        public override int SaveChanges()
        {
            IEnumerable<EntityEntry> entries = this.ChangeTracker.Entries();

            foreach (EntityEntry entry in entries)
            {
                if (entry.State == EntityState.Added)
                {
                    if (entry.Entity is Entity e)
                    {
                        e.IsActive = true;
                        e.CreatedAt = DateTime.UtcNow;
                    }
                }

                if (entry.State == EntityState.Modified)
                {
                    if (entry.Entity is Entity e)
                    {
                        e.UpdatedAt = DateTime.UtcNow;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<Benefit> Benefits { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<BlogImage> BlogImages { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<CompanyImage> CompanyImages { get; set; }
        public DbSet<Position> Positions { get; set; }
        public DbSet<Region> Region { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Remote> Remote { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<AspProjekat.Domain.Type> Types { get; set; }
        public DbSet<Testimonial> Testimonials { get; set; }
        public DbSet<User> Users { get; set; }  
        public DbSet<Technology> Technology { get; set; }

        public DbSet<JobTechnology> JobTechnology { get; set; }

        public DbSet<BenefitJob> BenefitJobs { get; set; }

        public DbSet<CategoryJob> CategoryJobs { get; set; }

        public DbSet<JobUser> JobUser { get; set; }

        public DbSet<ErrorLog> ErrorLogs { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
    }
}

