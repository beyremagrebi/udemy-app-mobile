class ResponseMessage {
  final String message;

  ResponseMessage({required this.message});

  factory ResponseMessage.fromDynamic(dynamic data) {
    if (data is Map<String, dynamic>) {
      return ResponseMessage(
        message: (data['message'] as String?) ??
            (data['msg'] as String?) ??
            (data['error'] as String?) ??
            'Unknown error',
      );
    }

    if (data is String) {
      return ResponseMessage(message: data);
    }

    return ResponseMessage(message: 'Unknown error');
  }
}
