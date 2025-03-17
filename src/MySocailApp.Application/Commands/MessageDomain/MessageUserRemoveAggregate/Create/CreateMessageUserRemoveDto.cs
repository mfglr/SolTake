using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.Create
{
    public record CreateMessageUserRemoveDto(int MessageId, bool Everyone) : IRequest;
}
