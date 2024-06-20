using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
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
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace AspProjekat.Implementation.UseCases.Commands.Companies
{
    public class EfUpdateCompanyCommand : EfUseCase, IUpdateCompanyCommand
    {
        public int Id => 4;
        public string Name => "Update Company";

        private readonly UpdateCompanyDtoValidator _validator;

        public EfUpdateCompanyCommand(AspContext context, UpdateCompanyDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateCompanyDto request)
        {
            _validator.ValidateAndThrow(request);

            var company = Context.Companies.FirstOrDefault(x => x.Id == request.Id);

            if (company == null)
            {
                throw new EntityNotFoundException("Blog ", request.Id);
            }

            company.Name = request.Name;
            company.Description = request.Description;
            company.IsActive = request.isActive;

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

                var image = new CompanyImage
                {
                    Path = "/images/" + filename
                };
                Context.CompanyImages.Add(image);
                company.Image = image;
            }

            Context.SaveChanges();
        }
    }
}
