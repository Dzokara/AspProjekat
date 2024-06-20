using AspProjekat.Application.DTO;
using AspProjekat.DataAccess;
using FluentValidation;
using System.Linq;

public class UpdateJobDtoValidator : AbstractValidator<UpdateJobDto>
{
    private readonly AspContext _context;

    public UpdateJobDtoValidator(AspContext context)
    {
        _context = context;

        RuleFor(x => x.Id).GreaterThan(0).WithMessage("Job Id must be greater than 0.")
                          .Must(JobExists).WithMessage("Job with the specified Id does not exist.");

        RuleFor(x => x.PositionId)
            .GreaterThan(0).When(x => x.PositionId.HasValue).WithMessage("Position Id must be greater than 0.")
            .Must(PositionExists).When(x => x.PositionId.HasValue).WithMessage("Position with the specified Id does not exist.");

        RuleFor(x => x.CompanyId)
            .GreaterThan(0).When(x => x.CompanyId.HasValue).WithMessage("Company Id must be greater than 0.")
            .Must(CompanyExists).When(x => x.CompanyId.HasValue).WithMessage("Company with the specified Id does not exist.");

        RuleFor(x => x.RegionId)
            .GreaterThan(0).When(x => x.RegionId.HasValue).WithMessage("Region Id must be greater than 0.")
            .Must(RegionExists).When(x => x.RegionId.HasValue).WithMessage("Region with the specified Id does not exist.");

        RuleFor(x => x.TypeId)
            .GreaterThan(0).When(x => x.TypeId.HasValue).WithMessage("Type Id must be greater than 0.")
            .Must(TypeExists).When(x => x.TypeId.HasValue).WithMessage("Type with the specified Id does not exist.");

        RuleFor(x => x.Description).MaximumLength(500).WithMessage("Description cannot be longer than 500 characters.");

        RuleFor(x => x.Salary).GreaterThan(0).When(x => x.Salary.HasValue).WithMessage("Salary must be greater than 0.");

        RuleFor(x => x.Deadline).GreaterThan(DateTime.Now).When(x => x.Deadline.HasValue).WithMessage("Deadline must be a future date.");

        RuleFor(x => x.RemoteId)
            .GreaterThan(0).When(x => x.RemoteId.HasValue).WithMessage("Remote Id must be greater than 0.")
            .Must(RemoteExists).When(x => x.RemoteId.HasValue).WithMessage("Remote with the specified Id does not exist.");

        RuleForEach(x => x.TechnologyIds).Must(TechnologyExists).WithMessage("One or more specified technologies do not exist.");
        RuleForEach(x => x.BenefitIds).Must(BenefitExists).WithMessage("One or more specified benefits do not exist.");
        RuleForEach(x => x.CategoryIds).Must(CategoryExists).WithMessage("One or more specified categories do not exist.");
    }

    private bool JobExists(int id) => _context.Jobs.Any(x => x.Id == id);
    private bool PositionExists(int? id) => _context.Positions.Any(x => x.Id == id);
    private bool CompanyExists(int? id) => _context.Companies.Any(x => x.Id == id);
    private bool RegionExists(int? id) => _context.Region.Any(x => x.Id == id);
    private bool TypeExists(int? id) => _context.Types.Any(x => x.Id == id);
    private bool RemoteExists(int? id) => _context.Remote.Any(x => x.Id == id);
    private bool TechnologyExists(int id) => _context.Technology.Any(x => x.Id == id);
    private bool BenefitExists(int id) => _context.Benefits.Any(x => x.Id == id);
    private bool CategoryExists(int id) => _context.Categories.Any(x => x.Id == id);
}
