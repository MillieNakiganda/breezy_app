class RegistrationStep {
  final int index;
  final String title;
  final String description;

  RegistrationStep({
    required this.index,
    required this.title,
    required this.description,
  });
}

final multiSteps = [
  RegistrationStep(
    index: 0,
    title: "Apply to joing Breezy",
    description:
        "After we review yur documents, you'll start receiving cleaning requests in your area",
  ),
  RegistrationStep(
    index: 1,
    title: "Verify your identity",
    description: "We need a few documents to keep Breezyy safe for everyone",
  ),
  //change this
  RegistrationStep(
    index: 2,
    title: "Documents Submitted",
    description:
        "Our admin is reviewing your application. We'll notify you within 24 hours",
  ),
];
