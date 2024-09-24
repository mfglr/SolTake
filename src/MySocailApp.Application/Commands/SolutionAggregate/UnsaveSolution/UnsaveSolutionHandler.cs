using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.UnsaveSolution
{
    public class UnsaveSolutionHandler(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<UnsaveSolutionDto>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UnsaveSolutionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _solutionWriteRepository.GetWithSaverByIdAsync(request.SolutionId, accountId, cancellationToken) ??
                throw new SolutionNotFoundException();
            solution.Unsave(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
