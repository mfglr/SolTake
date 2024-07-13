using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TooManyQuestionImagesException : ClientSideException
    {
        private readonly static string _message = "You can upload up to 5 images per question";
        public TooManyQuestionImagesException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
