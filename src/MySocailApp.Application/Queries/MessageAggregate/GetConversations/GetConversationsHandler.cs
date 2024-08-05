using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public class GetConversationsHandler(IMessageReadRepository messageRepository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetConversationsDto, List<MessageResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageReadRepository _messageRepository = messageRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetConversationsDto request, CancellationToken cancellationToken)
        {
            var accounId = _tokenReader.GetRequiredAccountId();
            var users = await _messageRepository.GetConversationsAsync(accounId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(users);
        }
    }
}
