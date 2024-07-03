using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImage
{
    public record GetUserImageDto : IRequest<byte[]>;
}
