using AspProjekat.Application.DTO;
using AspProjekat.DataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace AspProjekat.Implementation.Validators
{
    public class CreateCompanyDtoValidator : AbstractValidator<CreateCompanyDto>
    {
        private readonly AspContext _context;

        public CreateCompanyDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Company name is required.")
                .Must(BeUniqueName).WithMessage("Company with that name already exists.");

            RuleFor(x => x.Description)
                .NotEmpty().WithMessage("Description is required.")
                .MinimumLength(10).WithMessage("Description must be at least 10 characters long.");

            RuleFor(x => x.Image)
                            .NotEmpty().WithMessage("Image path is required.");
                        
        }

        private bool BeUniqueName(string name)
        {
            return !_context.Companies.Any(c => c.Name == name);
        }
    

    }
}
