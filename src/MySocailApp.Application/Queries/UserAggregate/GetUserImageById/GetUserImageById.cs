using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImageById
{
    public record GetUserImageById(string UserId) : IRequest<byte[]>;
}
