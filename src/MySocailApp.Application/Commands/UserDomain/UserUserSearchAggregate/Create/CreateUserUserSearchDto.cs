using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Create
{
    public record CreateUserUserSearchDto(int SearchedId) : IRequest<CreateUserUserSearchResponseDto>;
}
