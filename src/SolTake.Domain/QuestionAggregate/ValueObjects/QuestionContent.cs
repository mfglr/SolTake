﻿using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionContent
    {
        public readonly static int MaxSoluiontContentLength = 1000;
        public string Value { private set; get; }

        public QuestionContent(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            if (value.Length > MaxSoluiontContentLength)
                throw new QuestionContentLengthExceededException();
            Value = value;
        }
    }
}
