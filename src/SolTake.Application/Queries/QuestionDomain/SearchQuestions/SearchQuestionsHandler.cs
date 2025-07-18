﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.SearchQuestions
{
    public class SearchQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;

        public Task<List<QuestionResponseDto>> Handle(SearchQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository.SearchQuestionsAsync(_accessTokenReader.GetRequiredAccountId(), request, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
    }
}
