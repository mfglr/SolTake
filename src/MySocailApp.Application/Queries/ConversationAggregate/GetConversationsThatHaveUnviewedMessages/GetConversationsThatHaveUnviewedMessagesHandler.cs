using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationAggregate;
using MySocailApp.Domain.ConversationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversationsThatHaveUnviewedMessages
{
    public class GetConversationsThatHaveUnviewedMessagesHandler(IConversationReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetConversationsThatHaveUnviewedMessagesDto, List<ConversationResponseDto>>
    {
        private readonly IConversationReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<ConversationResponseDto>> Handle(GetConversationsThatHaveUnviewedMessagesDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var conversations = await _repository.GetConversationsThatHaveUnviewedMessages(accountId, cancellationToken);
            return _mapper.Map<List<ConversationResponseDto>>(conversations);
        }
    }
}
