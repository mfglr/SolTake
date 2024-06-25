using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public class BlockValidator : AbstractValidator<BlockDto>
    {
        public BlockValidator()
        {
            RuleFor(x => x.BlockedId).NotNull().NotEmpty().WithMessage("A blocked id is required!");
        }
    }
}
