using AspProjekat.Application.DTO;
using AspProjekat.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.Validators
{
    public class CreateRegionDtoValidator : AbstractValidator<CreateRegionDto>
    {
        private readonly AspContext _context;

        public CreateRegionDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Region name is required.")
                .Must(BeUniqueName).WithMessage("Region with that name already exists.");

        }

        private bool BeUniqueName(string name)
        {
            return !_context.Region.Any(c => c.Name == name);
        }


    }
}
