using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.MessageDomain.GetMessagesByUserId
{
    public class GetMessagesByUserIdHandler(IAccessTokenReader tokenReader, IMessageQueryRepository messageQueryRepository) : IRequestHandler<GetMessagesByUserIdDto, List<MessageResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public Task<List<MessageResponseDto>> Handle(GetMessagesByUserIdDto request, CancellationToken cancellationToken)
            => _messageQueryRepository
                .GetMessagesByUserIdAsync(
                    _tokenReader.GetRequiredAccountId(),
                    request.UserId,
                    request,
                    cancellationToken
                );
    }
}
