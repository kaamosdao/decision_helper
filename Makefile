install:
	dart pub get
build:
	flutter build apk
run:
	flutter run lib/main.dart
lint:
	flutter analyze
runtest:
	flutter test integration_test
