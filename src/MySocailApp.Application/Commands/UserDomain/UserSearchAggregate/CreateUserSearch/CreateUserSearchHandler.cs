using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.CreateUserSearch
{
    public class CreateUserSearchHandler(IUnitOfWork unitOfWork, IUserSearchWriteRepository userSearchWriteRepository, IUserAccessor userAccessor) : IRequestHandler<CreateUserSearchDto, CreateUserSearchResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserSearchWriteRepository _userSearchWriteRepository = userSearchWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateUserSearchResponseDto> Handle(CreateUserSearchDto request, CancellationToken cancellationToken)
        {
            var prev = await _userSearchWriteRepository.GetAsync(_userAccessor.User.Id, request.SearchedId,cancellationToken);
            if(prev != null)
                _userSearchWriteRepository.Delete(prev);

            var next = UserSearch.Create(_userAccessor.User.Id, request.SearchedId);
            await _userSearchWriteRepository.CreateAsync(next, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new(next.Id);
        }
    }
}
