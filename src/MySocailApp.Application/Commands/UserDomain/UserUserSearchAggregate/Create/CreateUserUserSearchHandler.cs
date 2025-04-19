using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserUserSearchAggregate.DomainServices;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Create
{
    public class CreateUserUserSearchHandler(IUnitOfWork unitOfWork, IUserUserSearchWriteRepository userUserVisitWriteRepository, IUserAccessor userAccessor, UserUserSearchCreatorDomainService userUserSearchCreatorDomainService) : IRequestHandler<CreateUserUserSearchDto, CreateUserUserSearchResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserUserSearchWriteRepository _userUserVisitWriteRepository = userUserVisitWriteRepository;
        private UserUserSearchCreatorDomainService _userUserSearchCreatorDomainService = userUserSearchCreatorDomainService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateUserUserSearchResponseDto> Handle(CreateUserUserSearchDto request, CancellationToken cancellationToken)
        {
            var userUserSearch = new UserUserSearch(_userAccessor.User.Id, request.SearchedId);
            await _userUserSearchCreatorDomainService.CreateAsync(userUserSearch, cancellationToken);
            await _userUserVisitWriteRepository.CreateAsync(userUserSearch, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(userUserSearch.Id);
        }
    }
}
