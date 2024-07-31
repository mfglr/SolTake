using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate.GetMessagesByConversationId
{
    public class GetMessagesByContactIdHandler(IMessageReadRepository messageRepository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetMessagesByContactIdDto, List<MessageResponseDto>>
    {
        private readonly IMessageReadRepository _messageRepository = messageRepository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task<List<MessageResponseDto>> Handle(GetMessagesByContactIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var messages = await _messageRepository.GetByContactId(accountId, request.UserId, request.LasId, request.Take, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
