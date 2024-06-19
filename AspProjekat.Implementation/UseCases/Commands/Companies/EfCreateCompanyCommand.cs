using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Companies;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;

namespace AspProjekat.Implementation.UseCases.Commands.Companies
{
    public class EfCreateCompanyCommand : EfUseCase, ICreateCompanyCommand
    {
        public int Id => 4;
        public string Name => "CreateCompany";

        private readonly CreateCompanyDtoValidator _validator;

        public EfCreateCompanyCommand(AspContext context, CreateCompanyDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateCompanyDto data)
        {
            _validator.ValidateAndThrow(data);

            var extension = Path.GetExtension(data.Image.FileName);
            var filename = Guid.NewGuid().ToString() + extension;
            var savepath = Path.Combine("wwwroot", "images", filename);

            Directory.CreateDirectory(Path.GetDirectoryName(savepath));

            using(var fs = new FileStream(savepath,FileMode.Create))
            {
                data.Image.CopyTo(fs);
            }

            var image = new CompanyImage
            {
                Path = "/images/" + filename
            };

            var company = new Company
            {
                Name = data.Name,
                Description = data.Description,
                Image = image
            };
            Context.CompanyImages.Add(image);
            Context.Companies.Add(company);
            Context.SaveChanges();
        }
    }
}
