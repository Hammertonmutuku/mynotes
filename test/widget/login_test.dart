import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/views/login_view.dart';

void main(){
   testWidgets("enter emailadress", (WidgetTester tester) async {
     //find all widget needed
      final addEmail =  find.byKey(ValueKey("enterEmail"));
       final addPassword =  find.byKey(ValueKey("enterPassword"));
       final loginButton =  find.byKey(ValueKey("login"));
       
      //execute all test
      await tester.pumpWidget(MaterialApp(home: LoginView()));
      await tester.enterText(addEmail, 'hammertonmutuku@foo.bar');
      await tester.enterText(addPassword, 'logout1234');
      await tester.tap(loginButton);
      await tester.pump(Duration(seconds: 1));

     //check outputs
     expect(find.text('hammertonmutuku@foo.bar'), findsOneWidget);
      expect(find.text('logout1234'), findsOneWidget);

   });
}