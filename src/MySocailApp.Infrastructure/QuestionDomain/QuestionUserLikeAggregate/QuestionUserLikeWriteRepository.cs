﻿using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeAggregate
{
    public class QuestionUserLikeWriteRepository(AppDbContext context) : IQuestionUserLikeWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionUserLike like, CancellationToken cancellationToken)
            => await _context.QuestionUserLikes.AddAsync(like, cancellationToken);

        public void Delete(QuestionUserLike like)
            => _context.QuestionUserLikes.Remove(like);

        public void DeleteRange(IEnumerable<QuestionUserLike> likes)
            => _context.QuestionUserLikes.RemoveRange(likes);

        

        public Task<List<QuestionUserLike>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes.Where(x => x.UserId == userId).ToListAsync(cancellationToken);

        public Task<QuestionUserLike?> GetAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes.FirstOrDefaultAsync(x => x.QuestionId == questionId && x.UserId == userId, cancellationToken: cancellationToken);
        public Task<List<QuestionUserLike>> GetAsync(IEnumerable<int> questionIds, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes.Where(x => questionIds.Contains(x.QuestionId) && x.UserId == userId).ToListAsync(cancellationToken);



    }
}
