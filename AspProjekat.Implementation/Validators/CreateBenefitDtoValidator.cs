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
    public class CreateBenefitDtoValidator : AbstractValidator<CreateBenefitDto>
    {
        private readonly AspContext _context;

        public CreateBenefitDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Benefit name is required.")
                .Must(BeUniqueName).WithMessage("Benefit with that name already exists.");

        }

        private bool BeUniqueName(string name)
        {
            return !_context.Benefits.Any(c => c.Name == name);
        }


    }
}
