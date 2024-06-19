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
    public class CreateCommentDtoValidator : AbstractValidator<CreateCommentDto>
    {
        private readonly AspContext ctx;

        public CreateCommentDtoValidator(AspContext context)
        {
            ctx = context;
            CascadeMode = CascadeMode.StopOnFirstFailure;

            RuleFor(x => x.AuthorId)
                .Must(ExistInAuthors).WithMessage("Author with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.BlogId)
                .Must(ExistInBlogs).WithMessage("Blog with an ID of {PropertyValue} does not exist.");

            RuleFor(x => x.Text)
                .NotEmpty().WithMessage("Text is required.");

        }
        private bool ExistInAuthors(int authorId)
        {
            return ctx.Users.Any(c => c.Id == authorId);
        }

        private bool ExistInBlogs(int blogId)
        {
            return ctx.Blogs.Any(r => r.Id == blogId);
        }

    }
}