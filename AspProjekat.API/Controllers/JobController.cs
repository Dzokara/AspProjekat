using AspProjekat.Application;
using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Jobs;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation;
using AspProjekat.Implementation.UseCases.Commands.Jobs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public JobController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        

        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateJobDto dto,
                                  [FromServices] ICreateJobCommand command)
        {
            _handler.HandleCommand(command, dto);

            return StatusCode(201);
        }

        [Authorize]
        [HttpPost("{id}/like")]
        public IActionResult JobLike(int id, [FromServices] ILikeJobCommand command)
        {
            _handler.HandleCommand(command, id);

            return NoContent();
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Job job = _context.Jobs.Find(id);

            if (job == null)
            {
                return NotFound();
            }

            if (job.SavedUsers.Any())
            {
                return Conflict(new { error = "Job is liked by people." });
            }

            _context.Jobs.Remove(job);

            return NoContent();
        }
    }
}
