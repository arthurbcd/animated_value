import 'package:animated_value/animated_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Testing AnimatedValue widget
  const begin = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.red),
  );
  const end = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.blue),
  );
  group('AnimatedValue', () {
    testWidgets('should build with a non-null value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AnimatedValue<int>(
            value: 1,
            builder: (context, value, child) => Text('$value'),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
    });
  });

  // Testing LerpTween class
  group('LerpTween', () {
    test('should perform linear interpolation', () {
      final lerpTween = LerpTween<ButtonStyle?>(
        begin: begin,
        end: end,
        lerp: ButtonStyle.lerp,
      );

      expect(
        lerpTween.lerp(0.0)?.backgroundColor?.resolve({})?.value,
        begin.backgroundColor?.resolve({})?.value,
      );

      expect(
        lerpTween.lerp(0.5)?.backgroundColor?.resolve({})?.value,
        ButtonStyle.lerp(begin, end, 0.5)?.backgroundColor?.resolve({})?.value,
      );

      expect(
        lerpTween.lerp(1.0)?.backgroundColor?.resolve({})?.value,
        end.backgroundColor?.resolve({})?.value,
      );
    });
  });

  // Testing extension method on LerpCallback
  group('TweenExtension', () {
    test('should create a LerpTween using tween method', () {
      final lerpTween = ButtonStyle.lerp.tween(begin, end);

      expect(lerpTween.begin, begin);
      expect(lerpTween.end, end);
    });
  });
}
