using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageDto : IRequest<RemoveUserImageResponseDto>;
}
