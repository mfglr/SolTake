using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public class GetConversationsHandler(IAppUserReadRepository userReadRepository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetConversationsDto, List<AppUserResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IAppUserReadRepository _userReadRepository = userReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(GetConversationsDto request, CancellationToken cancellationToken)
        {
            var accounId = _tokenReader.GetRequiredAccountId();
            var users = await _userReadRepository.GetConversationsAsync(accounId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
