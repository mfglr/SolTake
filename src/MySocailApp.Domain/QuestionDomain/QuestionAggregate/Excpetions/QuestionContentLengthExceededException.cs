﻿using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions
{
    public class QuestionContentLengthExceededException : AppException
    {
        private readonly static string _messageEn = $"The content length exceeds the allowed maximum limit of {QuestionContent.MaxSoluiontContentLength} characters.";
        private readonly static string _messageTr = $"Sorunun içeriği {QuestionContent.MaxSoluiontContentLength} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionContentLengthExceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
