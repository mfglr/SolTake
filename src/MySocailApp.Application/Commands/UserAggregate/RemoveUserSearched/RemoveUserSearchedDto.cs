using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserSearched
{
    public record RemoveUserSearchedDto(int SearchedId) : IRequest;
}
