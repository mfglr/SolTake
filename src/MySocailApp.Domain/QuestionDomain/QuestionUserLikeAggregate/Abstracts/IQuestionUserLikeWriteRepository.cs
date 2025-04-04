﻿using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts
{
    public interface IQuestionUserLikeWriteRepository
    {
        Task CreateAsync(QuestionUserLike like,CancellationToken cancellationToken);
        void Delete(QuestionUserLike like);
        void DeleteRange(IEnumerable<QuestionUserLike> likes);

        Task<QuestionUserLike?> GetAsync(int questionId,int userId,CancellationToken cancellationToken);
        Task<List<QuestionUserLike>> GetByUserIdAsync(int userId,CancellationToken cancellationToken);
    }
}
