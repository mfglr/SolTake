using MediatR;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.MessageConnectionAggregate.Exceptions;

namespace SolTake.Application.Queries.MessageDomain.GetMessageConnection
{
    public class GetMessageConnectionHandler(IMessageConnectionQueryRepository messageConnectionQueryRepository) : IRequestHandler<GetMessageConnectionDto, MessageConnectionResponseDto>
    {
        private readonly IMessageConnectionQueryRepository _messageConnectionQueryRepository = messageConnectionQueryRepository;

        public async Task<MessageConnectionResponseDto> Handle(GetMessageConnectionDto request, CancellationToken cancellationToken)
        {
            var connection =
                await _messageConnectionQueryRepository.GetById(request.Id, cancellationToken) ?? 
                throw new MessageConnectionNotFoundException();

            return connection;
        }
    }
}
