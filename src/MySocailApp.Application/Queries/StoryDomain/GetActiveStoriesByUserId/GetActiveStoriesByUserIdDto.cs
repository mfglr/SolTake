using MediatR;

namespace MySocailApp.Application.Queries.StoryDomain.GetActiveStoriesByUserId
{
    public record GetActiveStoriesByUserIdDto(int UserId) : IRequest<List<StoryResponseDto>>;
}
