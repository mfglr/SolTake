using MediatR;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessageConnection
{
    public record GetMessageConnectionDto(int Id) : IRequest<MessageConnectionResponseDto>;
}
