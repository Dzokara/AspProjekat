using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Positions;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.DataAccess;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Positions
{
    public class EfUpdatePositionCommand : EfUseCase, IUpdatePositionCommand
    {


        public int Id => 4;

        public string Name => "Update position";

        private readonly UpdatePositionDtoValidator _validator;

        public EfUpdatePositionCommand(AspContext context, UpdatePositionDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdatePositionDto request)
        {

            _validator.ValidateAndThrow(request);

            var position = Context.Positions.FirstOrDefault(x => x.Id == request.Id);

            if (position == null)
            {
                throw new EntityNotFoundException("Position ", request.Id);
            }

            position.Name = request.Name;
            position.IsActive = request.isActive;

            Context.SaveChanges();
        }
    }
}
