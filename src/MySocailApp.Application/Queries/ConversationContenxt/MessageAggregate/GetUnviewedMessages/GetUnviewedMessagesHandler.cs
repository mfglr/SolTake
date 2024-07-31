using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate.GetUnviewedMessages
{
    public class GetUnviewedMessagesHandler(IMessageReadRepository repository, IAccessTokenReader accessTokenReader, IMapper mapper) : IRequestHandler<GetUnviewedMessagesDto, List<MessageResponseDto>>
    {
        private readonly IMessageReadRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetUnviewedMessagesDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetUnviewedMessagesByReceiverId(accountId, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
