using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessagesByConversationId
{
    public class GetUnviewedMessagesByConversationIdHandler(IMessageReadRepository repository, IMapper mapper) : IRequestHandler<GetUnviewedMessagesByConversationIdDto, List<MessageResponseDto>>
    {
        private readonly IMessageReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetUnviewedMessagesByConversationIdDto request, CancellationToken cancellationToken)
        {
            var messages = await _repository.GetUnviewedMessagesByConversationId(request.ConversationId, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
