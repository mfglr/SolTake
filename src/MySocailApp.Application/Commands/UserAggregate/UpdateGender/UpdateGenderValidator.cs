using FluentValidation;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateGender
{
    public class UpdateGenderValidator : AbstractValidator<UpdateGenderDto>
    {
        public UpdateGenderValidator()
        {
            RuleFor(x => x.Gender)
                .Must(
                    x =>
                        x == (int)Gender.NoGender ||
                        x == (int)Gender.Male ||
                        x == (int)Gender.Female
                )
                .WithMessage("Invalid gender value");
        }
    }
}
