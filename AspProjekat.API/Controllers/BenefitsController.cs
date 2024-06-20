using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AspProjekat.Application.UseCases.Commands.Users;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BenefitsController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public BenefitsController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] BenefitSearch search, [FromServices] IGetBenefitsQuery query)
          => Ok(_handler.HandleQuery(query, search));
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateBenefitDto dto, [FromServices] ICreateBenefitCommand cmd)
        {
            _handler.HandleCommand(cmd, dto);
            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Benefit benefit = _context.Benefits.Find(id);

            if (benefit == null)
            {
                return NotFound();
            }

            benefit.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }
        [HttpPut("{id}")]
        public IActionResult UpdateBenefit(int id, [FromBody] UpdateBenefitDto dto,
                                                  [FromServices] IUpdateBenefitCommand command)
        {
            dto.Id = id;
            _handler.HandleCommand(command, dto);

            return NoContent();
        }
    }
}
