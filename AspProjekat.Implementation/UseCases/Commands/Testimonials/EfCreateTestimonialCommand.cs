using AspProjekat.Application.DTO;
using AspProjekat.Application.UseCases.Commands.Technologies;
using AspProjekat.Application.UseCases.Commands.Testimonials;
using AspProjekat.DataAccess;
using AspProjekat.Domain;
using AspProjekat.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspProjekat.Implementation.UseCases.Commands.Testimonials
{
    public class EfCreateTestimonialCommand : EfUseCase, ICreateTestimonialCommand
    {
        public int Id => 4;
        public string Name => "Create testimonial";

        private readonly CreateTestimonialDtoValidator _validator;

        public EfCreateTestimonialCommand(AspContext context, CreateTestimonialDtoValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(CreateTestimonialDto data)
        {
            _validator.ValidateAndThrow(data);

            var testimonial = new Testimonial
            {
                Text = data.Text,
                UserId = data.UserId
            };

            Context.Testimonials.Add(testimonial);
            Context.SaveChanges();
        }
    }
}
