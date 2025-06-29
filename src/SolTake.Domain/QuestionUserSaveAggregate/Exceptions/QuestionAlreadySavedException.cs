﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Exceptions
{
    public class QuestionAlreadySavedException : AppException
    {
        private readonly static string _messageEn = "You have already saved the question before!";
        private readonly static string _messageTr = "Bu soruyu daha önce kaydettin!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionAlreadySavedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
