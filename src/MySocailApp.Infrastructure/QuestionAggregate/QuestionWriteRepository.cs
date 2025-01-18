using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
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
        public void DeleteRange(IEnumerable<Question> questions)
            => _context.Questions.RemoveRange(questions);

        public Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => _context.Questions.FirstOrDefaultAsync(x => x.Id == id);

        public Task<Question?> GetQuestionWithImagesAsync(int questionId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public Task<Question?> GetQuestionWithSaveAsync(int questionId, int saverId, CancellationToken cancellationToken)
            => _context.Questions
                .Include(x => x.Savers.Where(x => x.UserId == saverId))
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public async Task<Question?> GetWithLikeByIdAsync(int id,int userId,CancellationToken cancellationToken)
            => await _context.Questions
                .Include(x => x.Likes.Where(x => x.UserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.UserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

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
        public async Task DeleteQuestionUserLikesNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var likeNotifications = await _context.QuestionUserLikeNotifications.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.QuestionUserLikeNotifications.RemoveRange(likeNotifications);
        }
        public async Task DeleteQuestionUserSavesByUserId(int userId, CancellationToken cancellationToken)
        {
            var saves = await _context.QuestionUserSaves.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
            _context.RemoveRange(saves);
        }
    }
}
