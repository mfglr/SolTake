using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageDto : IRequest<RemoveUserImageResponseDto>;
}
