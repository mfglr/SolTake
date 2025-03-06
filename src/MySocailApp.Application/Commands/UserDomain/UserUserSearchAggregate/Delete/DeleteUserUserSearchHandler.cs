using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Delete
{
    public class DeleteUserUserSearchHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IUserUserSearchWriteRepository userUserVisitWriteRepository) : IRequestHandler<DeleteUserUserSearchDto>
    {
        private readonly IUserUserSearchWriteRepository _userUserVisitWriteRepository = userUserVisitWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteUserUserSearchDto request, CancellationToken cancellationToken)
        {
            var visit = await _userUserVisitWriteRepository.GetAsync(_userAccessor.User.Id, request.SearchedId, cancellationToken);
            if (visit != null)
                _userUserVisitWriteRepository.Delete(visit);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
