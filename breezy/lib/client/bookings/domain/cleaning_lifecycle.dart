class CleaningLifeCycle {
  final String event;
  final String status;
  CleaningLifeCycle({required this.event, required this.status});
}

final lifeCycleEvents = [
  CleaningLifeCycle(event: 'Request Accepted', status: 'completed'),
  CleaningLifeCycle(event: 'Cleaner en route', status: 'completed'),
  CleaningLifeCycle(event: 'Cleaning started', status: 'next'),
  CleaningLifeCycle(event: 'Cleaning completed', status: 'pending'),
];
