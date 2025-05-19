using MediatR;
using MySocailApp.Application.Queries.MessageDomain;

namespace MySocailApp.Application.Queries.MessageDomain.GetUnviewedMessages
{
    public record GetUnviewedMessagesDto() : IRequest<List<MessageResponseDto>>;
}
