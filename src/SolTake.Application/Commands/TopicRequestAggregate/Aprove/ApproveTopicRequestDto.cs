using MediatR;

namespace SolTake.Application.Commands.TopicRequestAggregate.Aprove
{
    public record ApproveTopicRequestDto(int Id) : IRequest;
}
