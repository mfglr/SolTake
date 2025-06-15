using MediatR;

namespace SolTake.Application.Commands.TopicAggregate.Commands
{
    public record DeleteTopicDto(int Id) : IRequest;
}
