using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Blogs;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using Azure.Core;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Blogs
{
    public class EfUpdateBlogCommand : EfUseCase, IUpdateBlogCommand
    {
        public int Id => 4;
        public string Name => "Update Blog";

        private readonly UpdateBlogDtoValidator _validator;

        public EfUpdateBlogCommand(AspContext context, UpdateBlogDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateBlogDto request)
        {
            _validator.ValidateAndThrow(request);

            var blog = Context.Blogs.FirstOrDefault(x => x.Id == request.Id);

            if (blog == null)
            {
                throw new EntityNotFoundException("Blog ", request.Id);
            }

            blog.Title = request.Title;
            blog.Description = request.Description;

            if (request.Image != null)
            {
                var extension = Path.GetExtension(request.Image.FileName);
                var filename = Guid.NewGuid().ToString() + extension;
                var savepath = Path.Combine("wwwroot", "images", filename);

                Directory.CreateDirectory(Path.GetDirectoryName(savepath));

                using (var fs = new FileStream(savepath, FileMode.Create))
                {
                    request.Image.CopyTo(fs);
                }

                var image = new BlogImage
                {
                    Path = "/images/" + filename
                };
                Context.BlogImages.Add(image);
                blog.Image = image;
            }

            Context.SaveChanges();
        }
    }
}
