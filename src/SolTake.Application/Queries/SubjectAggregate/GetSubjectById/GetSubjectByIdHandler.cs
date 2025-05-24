using AutoMapper;
using MediatR;
using SolTake.Domain.SubjectAggregate.Exceptions;
using SolTake.Domain.SubjectAggregate.Interfaces;

namespace SolTake.Application.Queries.SubjectAggregate.GetSubjectById
{
    public class GetSubjectByIdHandler(IMapper mapper, ISubjectReadRepository subjectReadRepository) : IRequestHandler<GetSubjectByIdDto, SubjectResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ISubjectReadRepository _subjectReadRepository = subjectReadRepository;

        public async Task<SubjectResponseDto> Handle(GetSubjectByIdDto request, CancellationToken cancellationToken)
        {
            var subject =
                await _subjectReadRepository.GetByIdAsync(request.SubjectId, cancellationToken) ??
                throw new SubjectNotFoundException();
            return _mapper.Map<SubjectResponseDto>(subject);
        }
    }
}
