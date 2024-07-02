using AspProjekat.Application.Exceptions;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AspProjekat.Domain;

namespace AspProjekat.Implementation.UseCases.Commands.Jobs
{
    public class EfLikeJobCommand : EfUseCase, ILikeJobCommand
    {
        private readonly IApplicationActor _actor;
        public EfLikeJobCommand(AspContext context, IApplicationActor actor) : base(context)
        {
            _actor = actor;
        }

        public int Id => 5;

        public string Name => "Job like";

        public void Execute(int data)
        {
            if (!Context.Jobs.Any(x => x.Id == data && x.IsActive && x.Deadline > DateTime.UtcNow))
            {
                throw new EntityNotFoundException(nameof(Job), data);
            }

            if (Context.JobUser.Any(x => x.UserId == _actor.Id && x.JobId == data))
            {
                throw new ConflictException("This job is already saved.");
            }

            Context.JobUser.Add(new JobUser
            {
                UserId = _actor.Id,
                JobId = data,
                Time = DateTime.UtcNow
            });

            Context.SaveChanges();

        }
    }
}
