﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionsByUserId
{
    public class GetQuestionsByUserIdHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetQuestionsByUserIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetUserQuestionsAsync(
                    request.UserId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
