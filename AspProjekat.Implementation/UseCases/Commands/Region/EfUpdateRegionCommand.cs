using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Categories;
using AspProjekat.Application.UseCases.Commands.Region;
using AspProjekat.DataAccess;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Region
{
    public class EfUpdateRegionCommand : EfUseCase, IUpdateRegionCommand
    {


        public int Id => 4;

        public string Name => "Update region";

        private readonly UpdateRegionDtoValidator _validator;

        public EfUpdateRegionCommand(AspContext context, UpdateRegionDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateRegionDto request)
        {

            _validator.ValidateAndThrow(request);

            var region = Context.Region.FirstOrDefault(x => x.Id == request.Id);

            if (region == null)
            {
                throw new EntityNotFoundException("Region ", request.Id);
            }

            region.Name = request.Name;
            region.IsActive = request.isActive;

            Context.SaveChanges();
        }
    }
}
