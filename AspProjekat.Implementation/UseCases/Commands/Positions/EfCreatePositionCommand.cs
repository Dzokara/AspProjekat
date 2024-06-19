using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Positions;
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

namespace AspProjekat.Implementation.UseCases.Commands.Positions
{
    public class EfCreatePositionCommand : EfUseCase, ICreatePositionCommand
    {
        public int Id => 4;
        public string Name => "Create position";

        private readonly CreatePositionDtoValidator _validator;

        public EfCreatePositionCommand(AspContext context, CreatePositionDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreatePositionDto data)
        {
            _validator.ValidateAndThrow(data);

            var position = new Position
            {
                Name = data.Name
            };

            Context.Positions.Add(position);
            Context.SaveChanges();
        }
    }
}
