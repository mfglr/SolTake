using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave
{
    public class CreateSolutionUserSaveHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository, ISolutionUserSaveReadRepository solutionUserSaveReadRepository) : IRequestHandler<CreateSolutionUserSaveDto, CreateSolutionUserSaveResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly ISolutionUserSaveWriteRepository _solutionUserSaveWriteRepository = solutionUserSaveWriteRepository;
        private readonly ISolutionUserSaveReadRepository _solutionUserSaveReadRepository = solutionUserSaveReadRepository;

        public async Task<CreateSolutionUserSaveResponseDto> Handle(CreateSolutionUserSaveDto request, CancellationToken cancellationToken)
        {
            if (await _solutionUserSaveReadRepository.ExistAsync(request.SolutionId, _userAccessor.User.Id, cancellationToken))
                throw new SolutionAlreadySavedException();

            var save = SolutionUserSave.Create(request.SolutionId, _userAccessor.User.Id);
            await _solutionUserSaveWriteRepository.CreateAsync(save,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(save.Id);
        }
    }
}
