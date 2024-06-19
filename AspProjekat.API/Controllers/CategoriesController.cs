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
using AspProjekat.Application.UseCases.Commands.Categories;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public CategoriesController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearch search, [FromServices] IGetCategoriesQuery query)
          => Ok(_handler.HandleQuery(query, search));
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateCategoryDto dto, [FromServices] ICreateCategoryCommand cmd)
        {
            _handler.HandleCommand(cmd, dto);
            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Category category = _context.Categories.Find(id);

            if (category == null)
            {
                return NotFound();
            }

            category.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }
    }
}
