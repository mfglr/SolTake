﻿using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class CommentWriteRepository(AppDbContext context) : ICommentWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Comment comment, CancellationToken cancellationToken)
            => await _context.AddAsync(comment, cancellationToken);

        public void Delete(Comment comment)
            => _context.Comments.Remove(comment);

        public void DeleteRange(IEnumerable<Comment> comments)
            => _context.Comments.RemoveRange(comments);

        public Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);

        public Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Include(x => x.LikeNotifications.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);



        public Task<Comment?> GetCommentAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments.FirstOrDefaultAsync(x => x.Id == commentId, cancellationToken);
        public Task<List<Comment>> GetUserCommentsAsync(int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.AppUserId == userId)
                .ToListAsync(cancellationToken);
        public Task<List<Comment>> GetQuestionCommentsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.QuestionId == questionId)
                .ToListAsync(cancellationToken);
        public Task<List<Comment>> GetSolutionCommentsAsync(int solutionId, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.SolutionId == solutionId)
                .ToListAsync(cancellationToken);
        public Task<List<Comment>> GetChildrenAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.ParentId == commentId)
                .ToListAsync(cancellationToken);
        public Task<List<Comment>> GetRepliesAsync(int commentId, CancellationToken cancellationToken)
            => _context.Comments
                .Where(x => x.RepliedId == commentId)
                .ToListAsync(cancellationToken);

        public Task<List<Comment>> GetCommentsLikedByUserId(int userId, CancellationToken cancellationToken)
            => _context.Comments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .Where(x => x.Likes.Any(x => x.AppUserId == userId))
                .ToListAsync(cancellationToken);
    }
}
