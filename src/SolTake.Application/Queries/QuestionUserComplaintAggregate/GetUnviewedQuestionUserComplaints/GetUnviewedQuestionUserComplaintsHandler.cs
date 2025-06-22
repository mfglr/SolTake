using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionUserComplaintAggregate.GetUnviewedQuestionUserComplaints
{
    internal class GetUnviewedQuestionUserComplaintsHandler(IQuestionUserComplaintQueryRepository questionUserComplaintQueryRepository) : IRequestHandler<GetUnviewedQuestionUserComplaintsDto, List<QuestionUserComplaintResponseDto>>
    {
        private readonly IQuestionUserComplaintQueryRepository _questionUserComplaintQueryRepository = questionUserComplaintQueryRepository;

        public Task<List<QuestionUserComplaintResponseDto>> Handle(GetUnviewedQuestionUserComplaintsDto request, CancellationToken cancellationToken)
            => _questionUserComplaintQueryRepository.GetUnviewedQuestionUserComplaintsAsync(request, cancellationToken);
    }
}
