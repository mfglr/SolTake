using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Domain.UserUserSearchAggregate.DomainServices;
using SolTake.Domain.UserUserSearchAggregate.Entities;

namespace SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Create
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
