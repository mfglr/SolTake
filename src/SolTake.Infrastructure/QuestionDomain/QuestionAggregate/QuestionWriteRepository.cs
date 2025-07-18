﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QuestionDomain.QuestionAggregate
{
    internal class QuestionWriteRepository(AppDbContext context) : IQuestionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
            => await _context.AddAsync(question, cancellationToken);

        public void Delete(Question question)
            => _context.Questions.Remove(question);
        public void DeleteRange(IEnumerable<Question> questions)
            => _context.Questions.RemoveRange(questions);

        public Task<Question?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Questions.FirstOrDefaultAsync(x => x.Id == id);

        public Task<Question?> GetQuestionWithImagesAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        
        public Task<Question?> GetQuestionAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public Task<List<Question>> GetUserQuestionsAsync(int userId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Medias)
                .Where(x => x.UserId == userId)
                .ToListAsync(cancellationToken);

        public async Task DeleteQuestionUserLikesByUserId(int userId, CancellationToken cancellationToken)
        {
            var likes = await _context.QuestionUserLikes.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.QuestionUserLikes.RemoveRange(likes);
        }
        public async Task DeleteQuestionUserSavesByUserId(int userId, CancellationToken cancellationToken)
        {
            var saves = await _context.QuestionUserSaves.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.RemoveRange(saves);
        }
    }
}
