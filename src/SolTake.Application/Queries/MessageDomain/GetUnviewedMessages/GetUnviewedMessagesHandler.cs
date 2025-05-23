using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.MessageDomain.GetUnviewedMessages
{
    public class GetUnviewedMessagesHandler(IMessageQueryRepository messageQueryRepository, IAccessTokenReader tokenReader) : IRequestHandler<GetUnviewedMessagesDto, List<MessageResponseDto>>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public Task<List<MessageResponseDto>> Handle(GetUnviewedMessagesDto request, CancellationToken cancellationToken)
            => _messageQueryRepository
                .GetUnviewedMessagesAsync(
                    _tokenReader.GetRequiredAccountId(),
                    cancellationToken
                );
    }
}
