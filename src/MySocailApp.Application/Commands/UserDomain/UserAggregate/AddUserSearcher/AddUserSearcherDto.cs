using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.AddUserSearcher
{
    public record AddUserSearcherDto(int SearchedId) : IRequest<AddUserSearcherCommandResponseDto>;
}
