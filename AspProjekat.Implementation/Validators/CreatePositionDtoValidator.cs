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
    public class CreatePositionDtoValidator : AbstractValidator<CreatePositionDto>
    {
        private readonly AspContext _context;

        public CreatePositionDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Position name is required.")
                .Must(BeUniqueName).WithMessage("Position with that name already exists.");

        }

        private bool BeUniqueName(string name)
        {
            return !_context.Positions.Any(c => c.Name == name);
        }


    }
}
