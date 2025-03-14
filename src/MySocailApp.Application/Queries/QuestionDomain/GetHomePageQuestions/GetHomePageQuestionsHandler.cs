﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.GetHomePageQuestions
{
    public class GetHomePageQuestionsHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetHomePageQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetHomePageQuestionsDto request, CancellationToken cancellationToken)
            => _repository.GetHomePageQuestionsAsync(
                     _accessTokenReader.GetRequiredAccountId(),
                     request,
                     cancellationToken
                );
    }
}
