using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationAggregate;
using MySocailApp.Domain.ConversationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversations
{
    public class GetConversationsHandler(IConversationReadRepository repository, IAccessTokenReader accessTokenReader, IMapper mapper) : IRequestHandler<GetConversationsDto, List<ConversationResponseDto>>
    {
        private readonly IConversationReadRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;

        public async Task<List<ConversationResponseDto>> Handle(GetConversationsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var conversations = await _repository.GetConversationsAsync(accountId, request.LastDate, request.Take, request.TakeMessage, cancellationToken);
            return _mapper.Map<List<ConversationResponseDto>>(conversations);
        }
    }
}
