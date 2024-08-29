using MediatR;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearched
{
    public record AddUserSearchedDto(int SearchedId) : IRequest<UserSearchResponseDto>;
}
