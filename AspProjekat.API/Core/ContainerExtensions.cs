using AspProjekat.Application;
using AspProjekat.Implementation.Logging.UseCases;
using AspProjekat.Implementation;
using System.IdentityModel.Tokens.Jwt;
using AspProjekat.Implementation.Validators;
using AspProjekat.Application.UseCases.Commands.Users;
using AspProjekat.Implementation.UseCases.Commands.Users;

namespace AspProjekat.API.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            //services.AddTransient<CreateCategoryDtoValidator>();
            //services.AddTransient<UpdateUserAccessDtoValidator>();
            //services.AddTransient<CreateImagePostDtoValidator>();
            //services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            //services.AddTransient<IUpdateUseAccessCommand, EfUpdateUserAccessCommand>();
            //services.AddTransient<ICreateImagePostCommand, EfCreateImagePostCommand>();
            //services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<UseCaseHandler>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IUseCaseLogger, SPUseCaseLogger>();
            services.AddTransient<RegisterUserDtoValidator>();
            //services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            //services.AddTransient<ILikePostCommand, EfLikePostCommand>();
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
