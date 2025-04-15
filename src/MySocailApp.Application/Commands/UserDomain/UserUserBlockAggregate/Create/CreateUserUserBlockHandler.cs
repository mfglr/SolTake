using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Create
{
    public class CreateUserUserBlockHandler(UserUserBlockCreatorDomainService userUserBlockCreatorDomainService, IAccessTokenReader accessTokenReader, IUserUserBlockRepository userUserBlockRepository, IUnitOfWork unitOfWork) : IRequestHandler<CreateUserUserBlockDto, CreateUserUserBlockResponseDto>
    {
        private readonly UserUserBlockCreatorDomainService _userUserBlockCreatorDomainService = userUserBlockCreatorDomainService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateUserUserBlockResponseDto> Handle(CreateUserUserBlockDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var userUserBlock = new UserUserBlock(login.UserId, request.BlockedId);
            await _userUserBlockCreatorDomainService.CreateAsync(userUserBlock, cancellationToken);
            await _userUserBlockRepository.CreateAsync(userUserBlock, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(userUserBlock, login);

        }
    }
}
