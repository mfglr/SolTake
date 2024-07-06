using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.CancelFollowRequest
{
    public class CancelFollowRequestValidator : AbstractValidator<CancelFollowRequestDto>
    {
        public CancelFollowRequestValidator()
        {
            RuleFor(x => x.RequesterId).NotNull().NotEmpty().WithMessage("A requester id is required!");
        }
    }
}
