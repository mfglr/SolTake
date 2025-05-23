using MediatR;

namespace SolTake.Application.Queries.MessageDomain.GetMessageConnection
{
    public record GetMessageConnectionDto(int Id) : IRequest<MessageConnectionResponseDto>;
}
