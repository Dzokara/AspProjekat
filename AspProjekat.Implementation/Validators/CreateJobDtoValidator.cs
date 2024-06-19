using AspProjekat.Application.DTO;
using AspProjekat.DataAccess;
using FluentValidation;
using System.Linq;

namespace AspProjekat.Implementation.Validators
{
    public class CreateJobDtoValidator : AbstractValidator<CreateJobDto>
    {
        private readonly AspContext ctx;

        public CreateJobDtoValidator(AspContext context)
        {
            ctx = context;
            CascadeMode = CascadeMode.StopOnFirstFailure;

            RuleFor(x => x.PositionId)
                .Must(ExistInPositions).WithMessage("Position with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.CompanyId)
                .Must(ExistInCompanies).WithMessage("Company with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.RegionId)
                .Must(ExistInRegions).WithMessage("Region with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.TypeId)
                .Must(ExistInTypes).WithMessage("Type with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.RemoteId)
                .Must(ExistInRemote).WithMessage("Remote with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.TechnologyIds)
                .Must(ExistInTechnologies).WithMessage("Some Technology IDs do not exist.");

            RuleFor(x => x.BenefitIds)
                .Must(ExistInBenefits).WithMessage("Some Benefit IDs do not exist.");

            RuleFor(x => x.Description)
                .NotEmpty().WithMessage("Description is required.");

            RuleFor(x => x.Salary)
                .GreaterThan(0).WithMessage("Salary must be greater than zero.");

            RuleFor(x => x.Deadline)
                .GreaterThan(DateTime.Now).WithMessage("Deadline must be a future date.");
        }

        private bool ExistInPositions(int positionId)
        {
            return ctx.Positions.Any(p => p.Id == positionId);
        }

        private bool ExistInCompanies(int companyId)
        {
            return ctx.Companies.Any(c => c.Id == companyId);
        }

        private bool ExistInRegions(int regionId)
        {
            return ctx.Region.Any(r => r.Id == regionId);
        }

        private bool ExistInTypes(int typeId)
        {
            return ctx.Types.Any(t => t.Id == typeId);
        }

        private bool ExistInRemote(int remoteId)
        {
            return ctx.Remote.Any(r => r.Id == remoteId);
        }

        private bool ExistInTechnologies(IEnumerable<int> technologyIds)
        {
            var technologyIdsInDb = ctx.Technology.Select(t => t.Id).ToHashSet();
            return technologyIds.All(id => technologyIdsInDb.Contains(id));
        }

        private bool ExistInBenefits(IEnumerable<int> benefitIds)
        {
            var benefitIdsInDb = ctx.Benefits.Select(b => b.Id).ToHashSet();
            return benefitIds.All(id => benefitIdsInDb.Contains(id));
        }
    }
}
