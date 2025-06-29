﻿using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Exceptions;
using SolTake.Domain.QuestionUserSaveAggregate.Exceptions;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;

namespace SolTake.Domain.QuestionUserSaveAggregate.DomainServices
{
    public class QuestionUserSaveCreatorDomainService(IQuestionReadRepository questionReadRepository, IUserUserBlockRepository userUserBlockRepository, IQuestionUserSaveReadRepository questionUserSaveReadRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IQuestionUserSaveReadRepository _questionUserSaveReadRepository = questionUserSaveReadRepository;

        public async Task CreateAsync(QuestionUserSave questionUserSave, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(questionUserSave.QuestionId,cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(question.UserId, questionUserSave.UserId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(questionUserSave.UserId, question.UserId, cancellationToken))
                throw new UserBlockedException();

            if(await _questionUserSaveReadRepository.ExistAsync(questionUserSave.QuestionId, questionUserSave.UserId,cancellationToken))
                throw new QuestionAlreadySavedException();

            questionUserSave.Create();
        }
    }
}
