using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.Unfollow
{
    public class UnfollowValidator : AbstractValidator<UnfollowDto>
    {
        public UnfollowValidator()
        {
            RuleFor(x => x.FollowedId).NotNull().NotEmpty().WithMessage("A user id is required!");
        }
    }
}
