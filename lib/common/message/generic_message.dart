import 'package:cloud_walk_test/common/message/type_return.dart';
import 'package:cloud_walk_test/domain/app_error.dart';
import 'package:flutter/material.dart';

abstract class GenericMessage {
  String? title;
  String? message;
  Color? iconColor;
  String? positiveButtonText;
  Future<void> Function(TypeReturn typeReturn)? onEvent;

  GenericMessage({
    this.title,
    this.message,
    this.iconColor,
    this.onEvent,
    this.positiveButtonText,
  });

  GenericMessage setOnEvent(Future<void> Function(TypeReturn) onEvent) {
    this.onEvent = onEvent;
    return this;
  }

  GenericMessage setTitle(String title) {
    this.title = title;
    return this;
  }

  GenericMessage setMessage(String message) {
    this.message = message;
    return this;
  }

  GenericMessage setIconColor(Color iconColor) {
    this.iconColor = iconColor;
    return this;
  }

  GenericMessage setPositiveButtonText(String positiveButtonText) {
    this.positiveButtonText = positiveButtonText;
    return this;
  }

  EmptyMessage toEmptyMessage() {
    return EmptyMessage();
  }

  ErrorMessage toErrorMessage() {
    if (this is ErrorMessage) {
      return this as ErrorMessage;
    } else if (this is ErrorNetworkMessage) {
      final errorNetworkMessage = this as ErrorNetworkMessage;
      return ErrorMessage(
        title: errorNetworkMessage.title,
        message: errorNetworkMessage.message,
        positiveButtonText: errorNetworkMessage.positiveButtonText,
        onEvent: errorNetworkMessage.onEvent,
      );
    } else if (this is SuccessMessage) {
      final successMessage = this as SuccessMessage;
      return ErrorMessage(
        title: successMessage.title,
        message: successMessage.message,
        positiveButtonText: successMessage.positiveButtonText,
        onEvent: successMessage.onEvent,
      );
    } else if (this is ChooseMessage) {
      final chooseMessage = this as ChooseMessage;
      return ErrorMessage(
        title: chooseMessage.title,
        message: chooseMessage.message,
        positiveButtonText: chooseMessage.positiveButtonText,
        onEvent: chooseMessage.onEvent,
      );
    } else {
      return ErrorMessage(
        title: title,
        message: message,
        positiveButtonText: positiveButtonText,
        onEvent: onEvent,
      );
    }
  }

  ErrorNetworkMessage toErrorNetworkMessage() {
    if (this is ErrorMessage) {
      final errorMessage = this as ErrorMessage;
      return ErrorNetworkMessage(
        title: errorMessage.title,
        message: errorMessage.message,
        positiveButtonText: errorMessage.positiveButtonText,
        onEvent: errorMessage.onEvent,
      );
    } else if (this is ErrorNetworkMessage) {
      return this as ErrorNetworkMessage;
    } else if (this is SuccessMessage) {
      final successMessage = this as SuccessMessage;
      return ErrorNetworkMessage(
        title: successMessage.title,
        message: successMessage.message,
        positiveButtonText: successMessage.positiveButtonText,
        onEvent: successMessage.onEvent,
      );
    } else if (this is ChooseMessage) {
      final chooseMessage = this as ChooseMessage;
      return ErrorNetworkMessage(
        title: chooseMessage.title,
        message: chooseMessage.message,
        positiveButtonText: chooseMessage.positiveButtonText,
        onEvent: chooseMessage.onEvent,
      );
    } else {
      return ErrorNetworkMessage(
        title: title,
        message: message,
        positiveButtonText: positiveButtonText,
        onEvent: onEvent,
      );
    }
  }

  SuccessMessage toSuccessMessage() {
    if (this is ErrorMessage) {
      final errorMessage = this as ErrorMessage;
      return SuccessMessage(
        title: errorMessage.title,
        message: errorMessage.message,
        positiveButtonText: errorMessage.positiveButtonText,
        onEvent: errorMessage.onEvent,
      );
    } else if (this is ErrorNetworkMessage) {
      final errorNetworkMessage = this as ErrorNetworkMessage;
      return SuccessMessage(
        title: errorNetworkMessage.title,
        message: errorNetworkMessage.message,
        positiveButtonText: errorNetworkMessage.positiveButtonText,
        onEvent: errorNetworkMessage.onEvent,
      );
    } else if (this is SuccessMessage) {
      return this as SuccessMessage;
    } else if (this is ChooseMessage) {
      final chooseMessage = this as ChooseMessage;
      return SuccessMessage(
        title: chooseMessage.title,
        message: chooseMessage.message,
        positiveButtonText: chooseMessage.positiveButtonText,
        onEvent: chooseMessage.onEvent,
      );
    } else {
      return SuccessMessage(
        title: title,
        message: message,
        positiveButtonText: positiveButtonText,
        onEvent: onEvent,
      );
    }
  }

  ChooseMessage toChooseMessage() {
    if (this is ErrorMessage) {
      final errorMessage = this as ErrorMessage;
      return ChooseMessage(
        title: errorMessage.title,
        message: errorMessage.message,
        positiveButtonText: errorMessage.positiveButtonText,
        onEvent: errorMessage.onEvent,
      );
    } else if (this is ErrorNetworkMessage) {
      final errorNetworkMessage = this as ErrorNetworkMessage;
      return ChooseMessage(
        title: errorNetworkMessage.title,
        message: errorNetworkMessage.message,
        positiveButtonText: errorNetworkMessage.positiveButtonText,
        onEvent: errorNetworkMessage.onEvent,
      );
    } else if (this is SuccessMessage) {
      final successMessage = this as SuccessMessage;
      return ChooseMessage(
        title: successMessage.title,
        message: successMessage.message,
        positiveButtonText: successMessage.positiveButtonText,
        onEvent: successMessage.onEvent,
      );
    } else if (this is ChooseMessage) {
      return this as ChooseMessage;
    } else {
      return ChooseMessage(
        title: title,
        message: message,
        positiveButtonText: positiveButtonText,
        onEvent: onEvent,
      );
    }
  }
}

class EmptyMessage extends GenericMessage {
  EmptyMessage() : super();
}

class ErrorMessage extends GenericMessage {
  String? _positiveButtonText;

  @override
  String? get positiveButtonText => _positiveButtonText;
  @override
  set positiveButtonText(String? value) {
    _positiveButtonText = value;
  }

  final AppError? error;

  ErrorMessage({
    String? title,
    String? message,
    String? positiveButtonText,
    this.error,
    Color iconColor = Colors.red,
    Future<void> Function(TypeReturn)? onEvent,
  })  : _positiveButtonText = positiveButtonText,
        super(
          onEvent: onEvent,
          iconColor: iconColor,
          title: error?.title ?? title,
          message: error?.message ?? message,
        );

  factory ErrorMessage.error(AppError error) {
    return ErrorMessage(error: error);
  }

  factory ErrorMessage.message(String message) {
    return ErrorMessage(message: message);
  }

  factory ErrorMessage.title(String title) {
    return ErrorMessage(title: title);
  }

  ErrorMessage copyWith({
    String? title,
    String? message,
    String? positiveButtonText,
    Color? iconColor,
    Future<void> Function(TypeReturn)? onEvent,
  }) {
    return ErrorMessage(
      title: title ?? this.title,
      message: message ?? this.message,
      positiveButtonText: positiveButtonText ?? this.positiveButtonText,
      iconColor: iconColor ?? this.iconColor ?? Colors.purple,
      onEvent: onEvent ?? this.onEvent,
    );
  }
}

class ErrorNetworkMessage extends GenericMessage {
  String? _positiveButtonText;

  @override
  String? get positiveButtonText => _positiveButtonText;
  @override
  set positiveButtonText(String? value) {
    _positiveButtonText = value;
  }

  final AppError? error;

  ErrorNetworkMessage({
    String? title,
    String? message,
    String? positiveButtonText,
    Color? iconColor = Colors.pink,
    this.error,
    Future<void> Function(TypeReturn)? onEvent,
  })  : _positiveButtonText = positiveButtonText,
        super(
          title: title,
          message: message,
          iconColor: iconColor,
          onEvent: onEvent,
        );

  ErrorNetworkMessage copyWith({
    String? title,
    String? message,
    String? positiveButtonText,
    Color? iconColor,
    Future<void> Function(TypeReturn)? onEvent,
  }) {
    return ErrorNetworkMessage(
      title: title ?? this.title,
      message: message ?? this.message,
      positiveButtonText: positiveButtonText ?? this.positiveButtonText,
      iconColor: iconColor ?? this.iconColor ?? Colors.lightBlue,
      onEvent: onEvent ?? this.onEvent,
    );
  }
}

class SuccessMessage extends GenericMessage {
  String? _positiveButtonText;

  @override
  String? get positiveButtonText => _positiveButtonText;
  @override
  set positiveButtonText(String? value) {
    _positiveButtonText = value;
  }

  SuccessMessage({
    String? title,
    String? message,
    String? positiveButtonText,
    Color iconColor = Colors.white30,
    Future<void> Function(TypeReturn)? onEvent,
  })  : _positiveButtonText = positiveButtonText,
        super(
          title: title,
          message: message,
          iconColor: iconColor,
          onEvent: onEvent,
        );

  SuccessMessage copyWith({
    String? title,
    String? message,
    String? positiveButtonText,
    Color? iconColor,
    Future<void> Function(TypeReturn)? onEvent,
  }) {
    return SuccessMessage(
      title: title ?? this.title,
      message: message ?? this.message,
      positiveButtonText: positiveButtonText ?? this.positiveButtonText,
      iconColor: iconColor ?? this.iconColor ?? Colors.red,
      onEvent: onEvent ?? this.onEvent,
    );
  }
}

class ChooseMessage extends GenericMessage {
  String? _positiveButtonText;

  String? negativeButtonText;
  bool isNegativeBtnVisible;

  @override
  String? get positiveButtonText => _positiveButtonText;
  @override
  set positiveButtonText(String? value) {
    _positiveButtonText = value;
  }

  ChooseMessage({
    String? title,
    String? message,
    String? positiveButtonText,
    String? negativeButtonText,
    this.isNegativeBtnVisible = true,
    Future<void> Function(TypeReturn)? onEvent,
  })  : _positiveButtonText = positiveButtonText,
        negativeButtonText = negativeButtonText,
        super(
          title: title,
          message: message,
          onEvent: onEvent,
        );

  ChooseMessage copyWith({
    String? title,
    String? message,
    String? positiveButtonText,
    String? negativeButtonText,
    bool? isNegativeBtnVisible,
    Future<void> Function(TypeReturn)? onEvent,
  }) {
    return ChooseMessage(
      title: title ?? this.title,
      message: message ?? this.message,
      positiveButtonText: positiveButtonText ?? this.positiveButtonText,
      negativeButtonText: negativeButtonText ?? this.negativeButtonText,
      isNegativeBtnVisible: isNegativeBtnVisible ?? this.isNegativeBtnVisible,
      onEvent: onEvent ?? this.onEvent,
    );
  }
}
