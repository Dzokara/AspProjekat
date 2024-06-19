using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Blogs;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Testimonials;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestimonialController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public TestimonialController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] PagedSearch search, [FromServices] IGetTestimonialsQuery query)
          => Ok(_handler.HandleQuery(query, search));

        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateTestimonialDto dto, [FromServices] ICreateTestimonialCommand cmd)
        {
            _handler.HandleCommand(cmd, dto);
            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Testimonial testimonial = _context.Testimonials.Find(id);

            if (testimonial == null)
            {
                return NotFound();
            }

            testimonial.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }
    }
}
