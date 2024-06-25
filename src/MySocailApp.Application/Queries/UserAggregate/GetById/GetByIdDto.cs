using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetById
{
    public record GetByIdDto(string Id) : IRequest<UserResponseDto>;
}
