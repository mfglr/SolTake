﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentAggregate.Exceptions
{
    public class CommentIsNotRootException : AppException
    {
        private readonly static string _messageEn = "You can't reply this comment!";
        private readonly static string _messageTr = "Bu yoruma yanıt veremezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public CommentIsNotRootException() : base((int)HttpStatusCode.BadRequest) { }

    }
}
