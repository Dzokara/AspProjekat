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
    public class CreateTestimonialDtoValidator : AbstractValidator<CreateTestimonialDto>
    {
        private readonly AspContext ctx;

        public CreateTestimonialDtoValidator(AspContext context)
        {
            ctx = context;
            CascadeMode = CascadeMode.StopOnFirstFailure;

            RuleFor(x => x.UserId)
                .Must(ExistInAuthors).WithMessage("Author with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.Text)
                .NotEmpty().WithMessage("Text is required.");

        }
        private bool ExistInAuthors(int authorId)
        {
            return ctx.Users.Any(c => c.Id == authorId);
        }

    }
}
