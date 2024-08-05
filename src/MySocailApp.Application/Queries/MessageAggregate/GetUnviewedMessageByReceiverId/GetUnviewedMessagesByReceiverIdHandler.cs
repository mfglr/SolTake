using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessageByReceiverId
{
    public class GetUnviewedMessagesByReceiverIdHandler(IMessageReadRepository messageRepository, IAccessTokenReader tokenReader, IMapper mapper) : IRequestHandler<GetUnviewedMessagesByReceiverIdDto, List<MessageResponseDto>>
    {
        private readonly IMessageReadRepository _messageRepository = messageRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _Mapper = mapper;

        public async Task<List<MessageResponseDto>> Handle(GetUnviewedMessagesByReceiverIdDto request, CancellationToken cancellationToken)
        {
            var receiverId = _tokenReader.GetRequiredAccountId();
            var messages = await _messageRepository.GetUnviewedMessagesByReceiverId(receiverId, cancellationToken);
            return _Mapper.Map<List<MessageResponseDto>>(messages);
        }
    }
}
