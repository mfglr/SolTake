﻿using SolTake.Domain.QuestionAggregate.Entities;

namespace SolTake.Domain.QuestionAggregate.Abstracts
{
    public interface IQuestionWriteRepository
    {
        Task CreateAsync(Question question, CancellationToken cancellationToken);
        void Delete(Question question);
        void DeleteRange(IEnumerable<Question> questions);
        Task<Question?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesAsync(int questionId, CancellationToken cancellationToken);

        Task<Question?> GetQuestionAsync(int questionId, CancellationToken cancellationToken);
        Task<List<Question>> GetUserQuestionsAsync(int userId, CancellationToken cancellationToken);
    }
}
