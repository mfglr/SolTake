using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.DeleteUserSearch
{
    public class DeleteUserSearchHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IUserSearchWriteRepository userSearchWriteRepository) : IRequestHandler<DeleteUserSearchDto>
    {
        private readonly IUserSearchWriteRepository _userSearchWriteRepository = userSearchWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteUserSearchDto request, CancellationToken cancellationToken)
        {
            var search = await _userSearchWriteRepository.GetAsync(_userAccessor.User.Id, request.SearchedId, cancellationToken);
            if(search != null)
                _userSearchWriteRepository.Delete(search);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
