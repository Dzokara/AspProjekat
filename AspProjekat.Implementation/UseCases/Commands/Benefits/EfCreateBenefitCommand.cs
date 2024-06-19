using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Jobs;
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
    public class EfCreateBenefitCommand : EfUseCase, ICreateBenefitCommand
    {
        public int Id => 4;
        public string Name => "Create benefit";

        private readonly CreateBenefitDtoValidator _validator;

        public EfCreateBenefitCommand(AspContext context, CreateBenefitDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateBenefitDto data)
        {
            _validator.ValidateAndThrow(data);

            var benefit = new Benefit
            {
                Name = data.Name
            };

            Context.Benefits.Add(benefit);
            Context.SaveChanges();
        }
    }
}
