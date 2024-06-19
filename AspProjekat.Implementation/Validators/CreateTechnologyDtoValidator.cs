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
    public class CreateTechnologyDtoValidator : AbstractValidator<CreateTechnologyDto>
    {
        private readonly AspContext _context;

        public CreateTechnologyDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Technology name is required.")
                .Must(BeUniqueName).WithMessage("Technology with that name already exists.");

        }

        private bool BeUniqueName(string name)
        {
            return !_context.Technology.Any(c => c.Name == name);
        }


    }
}
