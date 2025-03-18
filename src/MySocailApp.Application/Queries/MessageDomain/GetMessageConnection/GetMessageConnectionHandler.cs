using MediatR;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessageConnection
{
    public class GetMessageConnectionHandler(IMessageConnectionReadRepository messageConnectionReadRepository) : IRequestHandler<GetMessageConnectionDto, MessageConnectionResponseDto>
    {
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = messageConnectionReadRepository;

        public async Task<MessageConnectionResponseDto> Handle(GetMessageConnectionDto request, CancellationToken cancellationToken)
        {
            var connection = 
                await _messageConnectionReadRepository.GetById(request.Id, cancellationToken) ?? 
                throw new MessageConnectionNotFoundException();

            return new (connection.Id,connection.State,connection.TypingId);
        }
    }
}
