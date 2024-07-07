using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImageById
{
    public record GetUserImageById(int UserId) : IRequest<byte[]>;
}
