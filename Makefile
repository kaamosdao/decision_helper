install:
	dart pub get
runbuild:
	flutter build apk
run:
	flutter run lib/main.dart
lint:
	flutter analyze
runtest:
	flutter run integration_test/main_test.dart
