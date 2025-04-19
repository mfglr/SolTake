using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Create
{
    public class CreateUserUserSearchHandler(IUnitOfWork unitOfWork, IUserUserSearchWriteRepository userUserVisitWriteRepository, IUserAccessor userAccessor) : IRequestHandler<CreateUserUserSearchDto, CreateUserUserSearchResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserUserSearchWriteRepository _userUserVisitWriteRepository = userUserVisitWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateUserUserSearchResponseDto> Handle(CreateUserUserSearchDto request, CancellationToken cancellationToken)
        {
            var prevVisit = await _userUserVisitWriteRepository.GetAsync(_userAccessor.User.Id, request.SearchedId, cancellationToken);
            if (prevVisit != null)
                _userUserVisitWriteRepository.Delete(prevVisit);

            var nextVisit = UserUserSearch.Create(_userAccessor.User.Id, request.SearchedId);
            await _userUserVisitWriteRepository.CreateAsync(nextVisit, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new CreateUserUserSearchResponseDto(nextVisit.Id);
        }
    }
}
