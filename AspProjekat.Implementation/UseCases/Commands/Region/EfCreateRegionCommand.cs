using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Region;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Region
{
    public class EfCreateRegionCommand : EfUseCase, ICreateRegionCommand
    {
        public int Id => 4;
        public string Name => "Create region";

        private readonly CreateRegionDtoValidator _validator;

        public EfCreateRegionCommand(AspContext context, CreateRegionDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateRegionDto data)
        {
            _validator.ValidateAndThrow(data);

            var region = new AspProjekat.Domain.Region
            {
                Name = data.Name
            };

            Context.Region.Add(region);
            Context.SaveChanges();
        }
    }
}
