using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AspProjekat.Application.UseCases.Commands.Region;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegionController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public RegionController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] RegionSearch search, [FromServices] IGetRegionQuery query)
          => Ok(_handler.HandleQuery(query, search));
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateRegionDto dto, [FromServices] ICreateRegionCommand cmd)
        {
            _handler.HandleCommand(cmd, dto);
            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Region region = _context.Region.Find(id);

            if (region == null)
            {
                return NotFound();
            }

            region.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }
    }
}
