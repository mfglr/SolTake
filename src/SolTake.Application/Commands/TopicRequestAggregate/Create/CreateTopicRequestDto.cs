using MediatR;

namespace SolTake.Application.Commands.TopicRequestAggregate.Create
{
    public record CreateTopicRequestDto(int SubjectId, string Name) : IRequest<CreateTopicRequestResponseDto>;
}
