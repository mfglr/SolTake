using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote
{
    public class MakeUpVoteHandler(IAccessTokenReader tokenReader, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<MakeUpvoteDto, MakeUpvoteCommandResponseDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<MakeUpvoteCommandResponseDto> Handle(MakeUpvoteDto request, CancellationToken cancellationToken)
        {
            int voterId = _tokenReader.GetRequiredAccountId();

            var solution =
                await _solutionWriteRepository.GetWithVoteAndVoteNotificationByIdAsync(request.SolutionId, voterId, cancellationToken) ??
                throw new SolutionNotFoundException();

            var vote = solution.MakeUpvote(voterId);
            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<MakeUpvoteCommandResponseDto>(vote);
        }
    }
}
