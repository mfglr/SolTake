using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessages
{
    public record GetUnviewedMessagesDto() : IRequest<List<MessageResponseDto>>;
}
