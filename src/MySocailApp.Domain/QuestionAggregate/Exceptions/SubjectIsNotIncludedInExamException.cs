using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Exceptions
{
    public class SubjectIsNotIncludedInExamException : AppException
    {
        private readonly static string _messageEn = "The subject is not included in the exam.";
        private readonly static string _messageTr = "Seçtiğin sınava seçtiğin konu dahil değil!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public SubjectIsNotIncludedInExamException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}
