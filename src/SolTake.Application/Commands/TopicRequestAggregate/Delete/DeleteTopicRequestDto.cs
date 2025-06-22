using MediatR;

namespace SolTake.Application.Commands.TopicRequestAggregate.Delete
{
    public record DeleteTopicRequestDto(int Id) : IRequest;
}
