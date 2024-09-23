using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionWriteRepository(AppDbContext context) : IQuestionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
            => await _context.AddAsync(question,cancellationToken);

        public void Delete(Question question)
            => _context.Questions.Remove(question);

        public async Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => await _context.Questions.FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved);

        public Task<Question?> GetQuestionWithAllAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Comments)
                .ThenInclude(x => x.Replies)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Children)
                .Include(x => x.Solutions)
                .ThenInclude(x => x.Comments)
                .ThenInclude(x => x.Children)
                .Include(x => x.Solutions)
                .ThenInclude(x => x.Comments)
                .ThenInclude(x => x.Replies)
                .FirstOrDefaultAsync(x => x.Id == questionId && !x.IsRemoved, cancellationToken);

        public Task<Question?> GetQuestionWithImagesAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == questionId && !x.IsRemoved, cancellationToken);

        public Task<Question?> GetQuestionWithSaveAsync(int questionId, int saverId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Saves.Where(x => x.AppUserId == saverId))
                .FirstOrDefaultAsync(x => x.Id == questionId && !x.IsRemoved, cancellationToken);

        public async Task<Question?> GetWithLikeByIdAsync(int id,int userId,CancellationToken cancellationToken)
            => await _context.Questions
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
    }
}
