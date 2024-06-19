using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Categories;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Categories
{
    public class EfCreateCategoryCommand : EfUseCase, ICreateCategoryCommand
    {
        public int Id => 4;
        public string Name => "Create category";

        private readonly CreateCategoryDtoValidator _validator;

        public EfCreateCategoryCommand(AspContext context, CreateCategoryDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateCategoryDto data)
        {
            _validator.ValidateAndThrow(data);

            var category = new Category
            {
                Name = data.Name
            };

            Context.Categories.Add(category);
            Context.SaveChanges();
        }
    }
}
