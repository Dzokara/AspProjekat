using AspProjekat.Application.DTO;
using AspProjekat.DataAccess;
using AspProjekat.Implementation.UseCases;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Application.UseCases.Commands.Users
{
    public class EfUpdateUserAccessCommand : EfUseCase, IUpdateUseAccessCommand
    {
        private UpdateUserAccessDtoValidator _validator;
        public EfUpdateUserAccessCommand(AspContext context,
             UpdateUserAccessDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 4;

        public string Name => "Modify user access";

        public void Execute(UpdateUserAccessDto data)
        {
            _validator.ValidateAndThrow(data);

            var userUseCases = Context.UserUseCases
                                      .Where(x => x.UserId == data.UserId)
                                      .ToList();

            Context.UserUseCases.RemoveRange(userUseCases);

            Context.UserUseCases.AddRange(data.UseCaseIds.Select(x =>
            new Domain.UserUseCase
            {
                UserId = data.UserId,
                UseCaseId = x
            }));

            Context.SaveChanges();
        }
    }
}
