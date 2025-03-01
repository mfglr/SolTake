using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserSearcher
{
    public record RemoveUserSearcherDto(int SearchedId) : IRequest;
}
