using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.DeleteMessage
{
    public record DeleteMessageDto(int MessageId, bool All) : IRequest;
}
