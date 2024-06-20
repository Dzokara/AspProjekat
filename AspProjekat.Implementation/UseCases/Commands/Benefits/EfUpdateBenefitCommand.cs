using AspProjekat.Application.DTO;
using AspProjekat.Application.Exceptions;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Benefits
{
    public class EfUpdateBenefitCommand : EfUseCase, IUpdateBenefitCommand
    {
        

        public int Id => 4;

        public string Name => "Update Benefit";

        private readonly UpdateBenefitDtoValidator  _validator;

        public EfUpdateBenefitCommand(AspContext context, UpdateBenefitDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public void Execute(UpdateBenefitDto request)
        {

            _validator.ValidateAndThrow(request);

            var benefit = Context.Benefits.FirstOrDefault(x => x.Id == request.Id);

            if (benefit == null)
            {
                throw new EntityNotFoundException("Benefit ", request.Id);
            }

            benefit.Name = request.Name;
            benefit.IsActive = request.isActive;

            Context.SaveChanges();
        }
    }
}
