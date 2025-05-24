using MediatR;

namespace SolTake.Application.Queries.StoryDomain.GetActiveStoriesByUserId
{
    public record GetActiveStoriesByUserIdDto(int UserId) : IRequest<List<StoryResponseDto>>;
}
