using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageDto : IRequest<byte[]>;
}
