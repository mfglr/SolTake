using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessagesByConversationId
{
    public class GetMessagesByConversationIdHandler(IMessageReadRepository messageRepository, IMapper mapper) : IRequestHandler<GetMessagesByConversationIdDto, List<MessageResponseDto>>
    {
        private readonly IMessageReadRepository _messageRepository = messageRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetMessagesByConversationIdDto request, CancellationToken cancellationToken)
        {
            var messages = await _messageRepository.GetByConversationId(request.ConversationId, request.LasId, request.Take, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
