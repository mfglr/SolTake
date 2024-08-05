using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessageByReceiverId
{
    public record GetUnviewedMessagesByReceiverIdDto() : IRequest<List<MessageResponseDto>>;
}
