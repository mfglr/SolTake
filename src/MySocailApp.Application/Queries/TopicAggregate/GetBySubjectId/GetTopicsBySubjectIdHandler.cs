using AutoMapper;
using MediatR;
using MySocailApp.Domain.TopicAggregate.Interfaces;

namespace MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId
{
    public class GetTopicsBySubjectIdHandler(IMapper mapper, ITopicReadRepository readRepository) : IRequestHandler<GetTopicsBySubjectIdDto, List<TopicResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ITopicReadRepository _readRepository = readRepository;

        public async Task<List<TopicResponseDto>> Handle(GetTopicsBySubjectIdDto request, CancellationToken cancellationToken)
        {
            var topics = await _readRepository.GetBySubjectId(request.SubjectId, cancellationToken);
            return _mapper.Map<List<TopicResponseDto>>(topics);
        }
    }
}
