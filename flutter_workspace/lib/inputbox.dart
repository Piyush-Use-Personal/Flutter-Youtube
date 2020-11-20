import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  Map<String, bool> data = {
    'username': false,
    // add your other form fields names here...
  };

  Future<void> checkIfUsernamePresent(String username) {
    return new Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          CustomInputBox(
            keyword: 'username',
            placeholder: 'Enter your username',
            hint: 'e.g speedcodez_1234',
            isLoaderNeeded: true,
            isVerificationDone: false,
            defaultIcon: Icon(Icons.person_add),
            onChanged: (text) {},
          )
        ],
      )),
    );
  }
}

class CustomInputBox extends StatefulWidget {
  final String keyword;
  final String placeholder;
  final String hint;
  final bool isLoaderNeeded;
  final bool isVerificationDone;
  final Widget defaultIcon;
  final ValueSetter<String> onChanged;

  CustomInputBox(
      {this.keyword,
      this.placeholder,
      this.hint,
      this.onChanged,
      this.isLoaderNeeded,
      this.defaultIcon,
      this.isVerificationDone,});

  @override
  _CustomInputBoxState createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  Widget suffix;
  void updateSuffix() {
    if (widget.isLoaderNeeded) {
      setState(() {
        suffix = SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
            height: 10.0,
            width: 15.0,
          );
      });
    } else {
      setState(() {
        suffix = widget.defaultIcon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    updateSuffix();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 200),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
              child: Text(
                '${widget.placeholder}',
                style: TextStyle(
                    color: Color.fromRGBO(165, 166, 178, 1), fontSize: 11),
              ),
            ),
          ),
          TextFormField(
            // onChanged: (text) {
            //   updateSuffix();
            //   widget.onChanged(text);
            // },
            style: TextStyle(
              color: Color.fromRGBO(22, 23, 35, 1),
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffix,
              hintText: '${widget.hint}',
              hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
              focusedBorder: InputBorder.none,
              // enabled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
         
          ),
        ],
      ),
    );
  }
}
