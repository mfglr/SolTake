using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserSearcher
{
    public record RemoveUserSearcherDto(int SearchedId) : IRequest;
}
