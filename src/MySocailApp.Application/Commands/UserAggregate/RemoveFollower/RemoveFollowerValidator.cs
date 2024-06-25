using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveFollower
{
    public class RemoveFollowerValidator : AbstractValidator<RemoveFollowerDto>
    {
        public RemoveFollowerValidator()
        {
            RuleFor(x => x.FollowerId).NotNull().NotEmpty().WithMessage("A user id is required");
        }
    }
}
