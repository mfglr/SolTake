using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class SubjectValidator : ISubjectValidator
    {
        public static readonly QuestionSubject[][] _subjects =
        [
            [//Tyt
                QuestionSubject.Turkce,
                QuestionSubject.Tarih,
                QuestionSubject.Cografya,
                QuestionSubject.Felsefe,
                QuestionSubject.Din,
                QuestionSubject.Matematik,
                QuestionSubject.Fizik,
                QuestionSubject.Kimya,
                QuestionSubject.Biyoloji
            ],
            [//Ayt
                QuestionSubject.Edebiyat,
                QuestionSubject.Tarih,
                QuestionSubject.Tarih1,
                QuestionSubject.Tarih2,
                QuestionSubject.Cografya,
                QuestionSubject.Cografya1,
                QuestionSubject.Cografya2,
                QuestionSubject.Felsefe,
                QuestionSubject.Psikoloji,
                QuestionSubject.Sosyoloji,
                QuestionSubject.Mantik,
                QuestionSubject.Din,
                QuestionSubject.Matematik,
                QuestionSubject.Geometri,
                QuestionSubject.Fizik,
                QuestionSubject.Kimya,
                QuestionSubject.Biyoloji
            ],
            [//Lgs
                QuestionSubject.Turkce,
                QuestionSubject.Inkilap,
                QuestionSubject.Din,
                QuestionSubject.Ingilizce,
                QuestionSubject.YabanciDil,
                QuestionSubject.Matematik,
                QuestionSubject.FenBilimleri
            ],
            [//Dgs
                QuestionSubject.Matematik,
                QuestionSubject.Geometri,
                QuestionSubject.Turkce
            ]
        ];

        public bool IsValid(QuestionExam exam, QuestionSubject subject) => _subjects[(int)exam].Contains(subject);
    }
}
