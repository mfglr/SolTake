using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;
using System.Runtime.InteropServices;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionWriteRepository(AppDbContext context) : IQuestionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
            => await _context.AddAsync(question,cancellationToken);

        public void Delete(Question question)
            => _context.Questions.Remove(question);
        public void DeleteRange(IEnumerable<Question> questions)
            => _context.Questions.RemoveRange(questions);

        public Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => _context.Questions.FirstOrDefaultAsync(x => x.Id == id);

        public Task<Question?> GetQuestionWithImagesAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public Task<Question?> GetQuestionWithSaveAsync(int questionId, int saverId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Savers.Where(x => x.AppUserId == saverId))
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public async Task<Question?> GetWithLikeByIdAsync(int id,int userId,CancellationToken cancellationToken)
            => await _context.Questions
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<Question?> GetQuestionAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public Task<List<Question>> GetUserQuestionsAsync(int userId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Images)
                .Where(x => x.AppUserId == userId)
                .ToListAsync(cancellationToken);

        public async Task DeleteQuestionUserLikesByUserId(int userId, CancellationToken cancellationToken)
        {
            var likes = await _context.QuestionUserLikes.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.QuestionUserLikes.RemoveRange(likes);
        }
        public async Task DeleteQuestionUserLikesNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var likeNotifications = await _context.QuestionUserLikeNotifications.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.QuestionUserLikeNotifications.RemoveRange(likeNotifications);
        }
        public async Task DeleteQuestionUserSavesByUserId(int userId, CancellationToken cancellationToken)
        {
            var saves = await _context.QuestionUserSaves.Where(x => x.AppUserId == userId).ToListAsync(cancellationToken);
            _context.RemoveRange(saves);
        }
    }
}
