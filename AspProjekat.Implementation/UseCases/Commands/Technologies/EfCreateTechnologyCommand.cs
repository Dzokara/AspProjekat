using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Categories;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Technologies
{
    public class EfCreateTechnologyCommand : EfUseCase, ICreateTechnologyCommand
    {
        public int Id => 4;
        public string Name => "Create technology";

        private readonly CreateTechnologyDtoValidator _validator;

        public EfCreateTechnologyCommand(AspContext context, CreateTechnologyDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateTechnologyDto data)
        {
            _validator.ValidateAndThrow(data);

            var technology = new Technology
            {
                Name = data.Name
            };

            Context.Technology.Add(technology);
            Context.SaveChanges();
        }
    }
}
