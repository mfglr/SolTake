using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearcher
{
    public record AddUserSearcherDto(int SearchedId) : IRequest<AddUserSearcherCommandResponseDto>;
}
