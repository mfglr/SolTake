using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId
{
    public class GetMessagesByUserIdHandler(IMessageReadRepository messageRepository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetMessagesByUserIdDto, List<MessageResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageReadRepository _messageRepository = messageRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetMessagesByUserIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var messages = await _messageRepository.GetMessagesByUserId(accountId,request.UserId,request.LastValue,request.Take, cancellationToken);
            return _mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
