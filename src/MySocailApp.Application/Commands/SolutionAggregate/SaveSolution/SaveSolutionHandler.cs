using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionAggregate.SaveSolution
{
    public class SaveSolutionHandler(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<SaveSolutionDto, SaveSolutionCommandResponseDto>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<SaveSolutionCommandResponseDto> Handle(SaveSolutionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _solutionWriteRepository.GetWithSaverByIdAsync(request.SolutionId, accountId, cancellationToken) ??
                throw new SolutionNotFoundException();
            var save = solution.Save(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<SaveSolutionCommandResponseDto>(save);
        }
    }
}
