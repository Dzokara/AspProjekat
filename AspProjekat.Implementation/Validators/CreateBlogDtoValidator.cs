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
    public class CreateBlogDtoValidator : AbstractValidator<CreateBlogDto>
    {
        private readonly AspContext _context;

        public CreateBlogDtoValidator(AspContext context)
        {
            CascadeMode = CascadeMode.StopOnFirstFailure;
            _context = context;

            RuleFor(x => x.Title)
                .NotEmpty().WithMessage("Title is required.")
                .Must(BeUniqueName).WithMessage("Blog with that title already exists.");

            RuleFor(x => x.Description)
                .NotEmpty().WithMessage("Description is required.")
                .MinimumLength(10).WithMessage("Description must be at least 10 characters long.");

            RuleFor(x => x.Image)
                            .NotEmpty().WithMessage("Image path is required.");

        }

        private bool BeUniqueName(string name)
        {
            return !_context.Blogs.Any(c => c.Title == name);
        }


    }
}
