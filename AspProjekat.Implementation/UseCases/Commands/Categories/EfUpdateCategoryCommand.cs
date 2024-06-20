using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Categories;
using AspProjekat.DataAccess;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Categories
{
    public class EfUpdateCategoryCommand : EfUseCase, IUpdateCategoryCommand
    {


        public int Id => 4;

        public string Name => "Update category";

        private readonly UpdateCategoryDtoValidator _validator;

        public EfUpdateCategoryCommand(AspContext context, UpdateCategoryDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateCategoryDto request)
        {

            _validator.ValidateAndThrow(request);

            var category = Context.Categories.FirstOrDefault(x => x.Id == request.Id);

            if (category == null)
            {
                throw new EntityNotFoundException("Category ", request.Id);
            }

            category.Name = request.Name;
            category.IsActive = request.isActive;

            Context.SaveChanges();
        }
    }
}
