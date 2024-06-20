using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Region;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.DataAccess;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Technologies
{
    public class EfUpdateTechnologyCommand : EfUseCase, IUpdateTechnologyCommand
    {


        public int Id => 4;

        public string Name => "Update technology";

        private readonly UpdateTechnologyDtoValidator _validator;

        public EfUpdateTechnologyCommand(AspContext context, UpdateTechnologyDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateTechnologyDto request)
        {

            _validator.ValidateAndThrow(request);

            var technology = Context.Technology.FirstOrDefault(x => x.Id == request.Id);

            if (technology == null)
            {
                throw new EntityNotFoundException("Technology ", request.Id);
            }

            technology.Name = request.Name;
            technology.IsActive = request.isActive;

            Context.SaveChanges();
        }
    }
}
