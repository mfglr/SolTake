using MediatR;
using MySocailApp.Application.Queries.MessageDomain;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessageById
{
    public record GetMessageByIdDto(int MessageId) : IRequest<MessageResponseDto>;
}
