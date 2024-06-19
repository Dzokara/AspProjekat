using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands;
using AspProjekat.Application.UseCases.Commands.Jobs;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System.Collections.Generic;
using System.Linq;

namespace AspProjekat.Implementation.UseCases.Commands.Jobs
{
    public class EfCreateJobCommand : EfUseCase, ICreateJobCommand
    {
        public int Id => 4;
        public string Name => "CreateJob";

        private readonly CreateJobDtoValidator _validator;

        public EfCreateJobCommand(AspContext context, CreateJobDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateJobDto data)
        {
            _validator.ValidateAndThrow(data);

            var job = new Job
            {
                PositionId = data.PositionId,
                CompanyId = data.CompanyId,
                RegionId = data.RegionId,
                TypeId = data.TypeId,
                Description = data.Description,
                Salary = data.Salary,
                Deadline = data.Deadline,
                RemoteId = data.RemoteId,
                Technology = data.TechnologyIds.Select(id => new JobTechnology { TechnologyId = id }).ToList(),
                Benefits = data.BenefitIds.Select(id => new BenefitJob { BenefitId = id }).ToList(),
                Categories = data.CategoryIds.Select(id=>new CategoryJob { CategoryId = id }).ToList(),
            };

            Context.Jobs.Add(job);
            Context.SaveChanges();
        }
    }
}
