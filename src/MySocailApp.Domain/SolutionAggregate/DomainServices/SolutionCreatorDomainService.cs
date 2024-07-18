using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService
    {
        public void Create(Account account, Question question, Solution solution, string? content, IEnumerable<SolutionImage> images)
        {
            if (question.AppUserId == account.Id)
                throw new UnableToSolveYourQuestionException();

            solution.Create(question.Id, account.Id, content, images);
        }
    }
}
