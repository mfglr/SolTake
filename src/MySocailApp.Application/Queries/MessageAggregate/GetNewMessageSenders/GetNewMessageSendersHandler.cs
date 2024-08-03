using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetNewMessageSenders
{
    public class GetNewMessageSendersHandler(IAppUserReadRepository userRepository, IAccessTokenReader tokenReader, IMapper mapper) : IRequestHandler<GetNewMessageSendersDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _Mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(GetNewMessageSendersDto request, CancellationToken cancellationToken)
        {
            var receiverId = _tokenReader.GetRequiredAccountId();
            var users = await _userRepository.GetNewMessagesSendersAsync(receiverId, cancellationToken);
            return _Mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
