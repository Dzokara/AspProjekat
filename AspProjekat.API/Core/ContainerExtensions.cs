using AspProjekat.Application;
using AspProjekat.Implementation.Logging.UseCases;
using AspProjekat.Implementation;
using System.IdentityModel.Tokens.Jwt;
using AspProjekat.Implementation.Validators;
using AspProjekat.Application.UseCases.Commands.Users;
using AspProjekat.Implementation.UseCases.Commands.Users;
using AspProjekat.Application.UseCases.Queries;
using AspProjekat.Implementation.UseCases.Queries;
using AspProjekat.Implementation.UseCases.Commands.Jobs;
using AspProjekat.Application.UseCases.Commands.Jobs;
using AspProjekat.Application.UseCases.Commands.Companies;
using AspProjekat.Implementation.UseCases.Commands.Companies;
using AspProjekat.Application.UseCases.Commands.Benefits;
using AspProjekat.Implementation.UseCases.Commands.Benefits;
using AspProjekat.Application.UseCases.Commands.Categories;
using AspProjekat.Implementation.UseCases.Commands.Categories;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.Implementation.UseCases.Commands.Technologies;

namespace AspProjekat.API.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<UpdateUserAccessDtoValidator>();
            services.AddTransient<CreateCompanyDtoValidator>();
            services.AddTransient<ICreateCompanyCommand, EfCreateCompanyCommand>();
            services.AddTransient<IUpdateUseAccessCommand, EfUpdateUserAccessCommand>();
            services.AddTransient<IGetJobsQuery,EfGetJobsQuery>();
            services.AddTransient<UseCaseHandler>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IUseCaseLogger, SPUseCaseLogger>();
            services.AddTransient<RegisterUserDtoValidator>();
            services.AddTransient<CreateJobDtoValidator>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<ILikeJobCommand, EfLikeJobCommand>();
            services.AddTransient<ICreateJobCommand, EfCreateJobCommand>();
            services.AddTransient<IGetCompaniesQuery, EfGetCompaniesQuery>();
            services.AddTransient<CreateBenefitDtoValidator>();
            services.AddTransient<IGetBenefitsQuery,EfGetBenefitsQuery>();
            services.AddTransient<ICreateBenefitCommand,EfCreateBenefitCommand>();
            services.AddTransient<CreateCategoryDtoValidator>();
            services.AddTransient<IGetCategoriesQuery,EfGetCategoriesQuery>();
            services.AddTransient<ICreateCategoryCommand,EfCreateCategoryCommand>();
            services.AddTransient<CreateTechnologyDtoValidator>();
            services.AddTransient<IGetTechnologiesQuery, EfGetTechnologiesQuery>();
            services.AddTransient<ICreateTechnologyCommand, EfCreateTechnologyCommand>();
        }

        public static Guid? GetTokenId(this HttpRequest request)
        {
            if (request == null || !request.Headers.ContainsKey("Authorization"))
            {
                return null;
            }

            string authHeader = request.Headers["Authorization"].ToString();

            if (authHeader.Split("Bearer ").Length != 2)
            {
                return null;
            }

            string token = authHeader.Split("Bearer ")[1];

            var handler = new JwtSecurityTokenHandler();

            var tokenObj = handler.ReadJwtToken(token);

            var claims = tokenObj.Claims;

            var claim = claims.First(x => x.Type == "jti").Value;

            var tokenGuid = Guid.Parse(claim);

            return tokenGuid;
        }
    }
}
