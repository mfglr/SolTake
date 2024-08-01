using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.ConversationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversationByReceiverId
{
    public class GetConversationByReceiverIdHandler(IConversationReadRepository repository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetConversationByReceiverIdDto, ConversationResponseDto>
    {
        private readonly IConversationReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task<ConversationResponseDto?> Handle(GetConversationByReceiverIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var conversation = await _repository.GetByUserIdsAsync([accountId, request.ReceiverId],request.TakeMessage, cancellationToken);
            return _mapper.Map<ConversationResponseDto>(conversation);
        }
    }
}
