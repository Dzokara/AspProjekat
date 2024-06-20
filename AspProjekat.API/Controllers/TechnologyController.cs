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
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.Application.UseCases.Commands.Region;

namespace AspProjekat.API.Controllers
{
        [Route("api/[controller]")]
        [ApiController]
        public class TechnologyController : ControllerBase
        {
            private IApplicationActor _actor;
            private UseCaseHandler _handler;
            private AspContext _context;
            public TechnologyController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
            {
                _actor = actor;
                _handler = handler;
                _context = context;
            }

            [HttpGet]
            public IActionResult Get([FromQuery] TechnologySearch search, [FromServices] IGetTechnologiesQuery query)
              => Ok(_handler.HandleQuery(query, search));
            [Authorize]
            [HttpPost]
            public IActionResult Post([FromBody] CreateTechnologyDto dto, [FromServices] ICreateTechnologyCommand cmd)
            {
                _handler.HandleCommand(cmd, dto);
                return StatusCode(201);
            }


            [HttpDelete("{id}")]
            public IActionResult Delete(int id)
            {
                Technology technology = _context.Technology.Find(id);

                if (technology == null)
                {
                    return NotFound();
                }

                technology.IsActive = false;
                _context.SaveChanges();

                return NoContent();
            }

            [HttpPut("{id}")]
            public IActionResult UpdateTechnology(int id, [FromBody] UpdateTechnologyDto dto,
                                                      [FromServices] IUpdateTechnologyCommand command)
            {
                dto.Id = id;
                _handler.HandleCommand(command, dto);

                return NoContent();
            }
    }
    }

