using MediatR;

namespace SolTake.Application.Queries.MessageDomain.GetMessageById
{
    public record GetMessageByIdDto(int MessageId) : IRequest<MessageResponseDto>;
}
