using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Jobs;
using AspProjekat.Application;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.UseCases.Commands.Jobs;
using AspProjekat.Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AspProjekat.Application.UseCases.Commands.Companies;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Application.UseCases.Commands.Blogs;

namespace AspProjekat.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : ControllerBase
    {
        private IApplicationActor _actor;
        private UseCaseHandler _handler;
        private AspContext _context;
        public CompanyController(IApplicationActor actor, UseCaseHandler handler, AspContext context)
        {
            _actor = actor;
            _handler = handler;
            _context = context;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] CompanySearch search, [FromServices] IGetCompaniesQuery query)
          => Ok(_handler.HandleQuery(query, search));


        [HttpGet("{id}")]
        public IActionResult GetSingle(int id, [FromServices] IGetSingleCompanyQuery query)
          => Ok(_handler.HandleQuery(query, id));

        [Authorize]
        [HttpPost]
        [Consumes("multipart/form-data")]
        public IActionResult Post([FromForm] CreateCompanyDto dto,
                                  [FromServices] ICreateCompanyCommand command)
        {
            _handler.HandleCommand(command, dto);

            return StatusCode(201);
        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Company company = _context.Companies.Find(id);

            if (company == null)
            {
                return NotFound();
            }

            company.IsActive = false;
            _context.SaveChanges();

            return NoContent();
        }

        [Authorize]
        [HttpPut("{id}")]
        [Consumes("multipart/form-data")]
        public IActionResult UpdateCompany(int id, [FromForm] UpdateCompanyDto dto,
                                 [FromServices] IUpdateCompanyCommand command)
        {
            dto.Id = id;

            _handler.HandleCommand(command, dto);

            return StatusCode(201);
        }
    }
}
