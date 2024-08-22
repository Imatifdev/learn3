class Course {
  final String title;
  final String points;
  final String duration;
  final String thumbnail;
  final double ratings;
  final int enrollments;
  final String about;
  final List<Section> sections;
  final List<Question> quiz;

  Course({
    required this.title,
    required this.points,
    required this.duration,
    required this.thumbnail,
    required this.ratings,
    required this.enrollments,
    required this.about,
    required this.sections,
    required this.quiz,
  });
}

class Section {
  final String title;
  final String readingMaterial;

  Section({required this.title, required this.readingMaterial});
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
