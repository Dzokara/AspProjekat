using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Companies;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AspProjekat.Application.UseCases.Commands.Blogs;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public BlogController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] PagedSearch search, [FromServices] IGetBlogsQuery query)
          => Ok(_handler.HandleQuery(query, search));

        [HttpGet("{id}")]
        public IActionResult GetSingle(int id, [FromServices] IGetSingleBlogQuery query)
         => Ok(_handler.HandleQuery(query, id));

        [Authorize]
        [HttpPost]
        [Consumes("multipart/form-data")]
        public IActionResult Post([FromForm] CreateBlogDto dto,
                                  [FromServices] ICreateBlogCommand command)
        {
            _handler.HandleCommand(command, dto);

            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Blog blog = _context.Blogs.Find(id);

            if (blog == null)
            {
                return NotFound();
            }

            blog.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }
    }
}
