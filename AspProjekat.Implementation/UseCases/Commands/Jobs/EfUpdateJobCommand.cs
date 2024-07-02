using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Jobs;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System.Linq;

namespace AspProjekat.Implementation.UseCases.Commands.Jobs
{
    public class EfUpdateJobCommand : EfUseCase, IUpdateJobCommand
    {
        private readonly UpdateJobDtoValidator _validator;
        private readonly AspContext _context;

        public EfUpdateJobCommand(AspContext context, UpdateJobDtoValidator validator)
            : base(context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id => 6;
        public string Name => "Update Job";

        public void Execute(UpdateJobDto request)
        {

            _validator.ValidateAndThrow(request);


            var job = Context.Jobs.FirstOrDefault(x => x.Id == request.Id);

            if (job == null)
            {
                throw new EntityNotFoundException("Job ", request.Id);
            }

            job.PositionId = request.PositionId ?? job.PositionId;
            job.CompanyId = request.CompanyId ?? job.CompanyId;
            job.RegionId = request.RegionId ?? job.RegionId;
            job.TypeId = request.TypeId ?? job.TypeId;
            job.Description = request.Description ?? job.Description;
            job.Salary = request.Salary ?? job.Salary;
            job.Deadline = request.Deadline ?? job.Deadline;
            job.RemoteId = request.RemoteId ?? job.RemoteId;

            UpdateJobTechnologies(job, request.TechnologyIds);
            UpdateJobBenefits(job, request.BenefitIds);
            UpdateJobCategories(job, request.CategoryIds);

            _context.SaveChanges();
        }

        private void UpdateJobTechnologies(Job job, IEnumerable<int>? technologyIds)
        {
            if (technologyIds != null)
            {
                job.Technology.Clear();
                foreach (var technologyId in technologyIds)
                {
                    job.Technology.Add(new JobTechnology
                    {
                        JobId = job.Id,
                        TechnologyId = technologyId
                    });
                }
            }
        }

        private void UpdateJobBenefits(Job job, IEnumerable<int>? benefitIds)
        {
            if (benefitIds != null)
            {
                job.Benefits.Clear();
                foreach (var benefitId in benefitIds)
                {
                    job.Benefits.Add(new BenefitJob
                    {
                        JobId = job.Id,
                        BenefitId = benefitId
                    });
                }
            }
        }

        private void UpdateJobCategories(Job job, IEnumerable<int>? categoryIds)
        {
            if (categoryIds != null)
            {
                job.Categories.Clear();
                foreach (var categoryId in categoryIds)
                {
                    job.Categories.Add(new CategoryJob
                    {
                        JobId = job.Id,
                        CategoryId = categoryId
                    });
                }
            }
        }
    }
}
