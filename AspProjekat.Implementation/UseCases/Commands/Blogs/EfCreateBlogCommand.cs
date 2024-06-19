using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Blogs;
using AspProjekat.Application.UseCases.Commands.Companies;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Blogs
{
    public class EfCreateBlogCommand : EfUseCase, ICreateBlogCommand
    {
        public int Id => 4;
        public string Name => "Create Blog";

        private readonly CreateBlogDtoValidator _validator;

        public EfCreateBlogCommand(AspContext context, CreateBlogDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateBlogDto data)
        {
            _validator.ValidateAndThrow(data);

            var extension = Path.GetExtension(data.Image.FileName);
            var filename = Guid.NewGuid().ToString() + extension;
            var savepath = Path.Combine("wwwroot", "images", filename);

            Directory.CreateDirectory(Path.GetDirectoryName(savepath));

            using (var fs = new FileStream(savepath, FileMode.Create))
            {
                data.Image.CopyTo(fs);
            }

            var image = new BlogImage
            {
                Path = "/images/" + filename
            };

            var blog = new Blog
            {
                Title = data.Title,
                Description = data.Description,
                Image = image
            };
            Context.BlogImages.Add(image);
            Context.Blogs.Add(blog);
            Context.SaveChanges();
        }
    }
}
