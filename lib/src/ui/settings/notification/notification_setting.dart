
import 'package:communiqo/src/constants/assets.dart';
import 'package:communiqo/src/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool check1 = false;
  TextEditingController _controllerSubject = TextEditingController();
  TextEditingController _controllerInstanceId = TextEditingController();
  TextEditingController _controllerSecretKey = TextEditingController();
  TextEditingController _controllerServiceWorkURL = TextEditingController();
  TextEditingController _controllerHost = TextEditingController();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPort = TextEditingController();
  TextEditingController _controllerSenderEmail = TextEditingController();
  TextEditingController _controllerSenderName = TextEditingController();
  TextEditingController _controllerEmailSignature = TextEditingController();
  TextEditingController _controllerEmailHeader = TextEditingController();
  TextEditingController _controllerNotificationIcon = TextEditingController();
  TextEditingController _controllerTestAgentMail = TextEditingController();
  TextEditingController _controllerLabel = TextEditingController();
  TextEditingController _controllerSingleLabel = TextEditingController();
  TextEditingController _controllerDashboardTitle = TextEditingController();
  TextEditingController _controllerReplyName = TextEditingController();
  TextEditingController _controllerReplyText = TextEditingController();
  TextEditingController _controllerContent = TextEditingController();
  double spaceDistance = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.of(context)!.current!.baseColor,
        body: Container(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // nav
              Container(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 10.0),
                child: Row(
                  children: [
                    ButtonIcon(
                      iconPath: Assets.arrowBack,
                      action: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(
                                color: NeumorphicTheme.currentTheme(context)
                                    .defaultTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSizedBoxHeight(),
                          buildTitleAndBody(
                              context: context,
                              title: "Sounds for admin",
                              body:
                                  "Play a sound when a agent receives an incoming message or sends an outgoing message.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context, selectedText: "None"),
                          buildSizedBoxHeight(),
                          Divider(),
                          buildSizedBoxHeight(),
                          buildTitleAndBody(
                              context: context,
                              title: "Agent email notifications",
                              body:
                                  "Send an email to an agent when a user replies and the agent is offline. An email is automatically sent to all agents for new conversations.",
                              isCheckBoxEnabled: true),
                          buildSizedBoxHeight(),
                          Divider(),
                          buildSizedBoxHeight(),
                          buildSizedBoxHeight(),
                          buildTitleAndBody(
                              context: context,
                              title: "Desktop notifications",
                              body:
                                  "Show a desktop notification when a new message is received.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context, selectedText: "Disabled"),
                          buildSizedBoxHeight(),
                          Divider(),
                          buildSizedBoxHeight(),
                          buildTitleAndBody(
                              context: context,
                              title: "Agent Notification Email",
                              body:
                                  "Email template for the notification email that is sent to an agent when a user sends a new message. You can use text, HTML, and the following merge fields: {conversation_link}, {recipient_name}, {sender_name}, {sender_profile_image}, {message}, {attachments}.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),

                          ///Subject
                          buildTitleOnly(
                              context: context,
                              title: "Subject",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerSubject,
                              hintText: "Subject"),
                          buildSizedBoxHeight(),

                          ///Content
                          buildTitleOnly(
                              context: context,
                              title: "Content",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildLongTextFormField(
                              context: context,
                              controller: _controllerContent,
                              hintText: "Content"),
                          buildSizedBoxHeight(),

                          /// Language dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Language",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context,
                              selectedText: "Select Language"),
                          buildSizedBoxHeight(),
                          Divider(),
                          buildSizedBoxHeight(),

                          ///Push notifications
                          buildTitleAndBody(
                              context: context,
                              title: "Push notifications",
                              body:
                                  "Push notifications settings. Insert the pusher Beams details.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTitleOnly(
                              context: context,
                              title: "Active for Admin area",
                              isCheckBoxEnabled: true),
                          buildSizedBoxHeight(),
                          buildTitleOnly(
                              context: context,
                              title: "Active for users",
                              isCheckBoxEnabled: true),
                          buildSizedBoxHeight(),
                          buildTitleOnly(
                              context: context,
                              title: "Instance id",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerInstanceId,
                              hintText: "Id"),
                          buildSizedBoxHeight(),
                          buildTitleOnly(
                              context: context,
                              title: "Secret Key",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerSecretKey,
                              hintText: "Key"),
                          buildSizedBoxHeight(),
                          buildTitleOnly(
                              context: context,
                              title: "Service Worker URL",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerServiceWorkURL,
                              hintText: "Url"),
                          buildSizedBoxHeight(),
                          buildTitleAndBody(
                              context: context,
                              title: "Email Settings",
                              body: "Outgoing SMTP SERVER INFORMATION",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),

                          ///host
                          buildTitleOnly(
                              context: context,
                              title: "Host",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerHost,
                              hintText: "Host"),
                          buildSizedBoxHeight(),

                          ///username
                          buildTitleOnly(
                              context: context,
                              title: "Username",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerUsername,
                              hintText: "Username"),
                          buildSizedBoxHeight(),

                          ///password
                          buildTitleOnly(
                              context: context,
                              title: "Password",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerPassword,
                              hintText: "Password"),
                          buildSizedBoxHeight(),

                          ///Port
                          buildTitleOnly(
                              context: context,
                              title: "Port",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerPort,
                              hintText: "Port"),
                          buildSizedBoxHeight(),

                          ///sender email
                          buildTitleOnly(
                              context: context,
                              title: "Sender Email",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerSenderEmail,
                              hintText: "Email"),
                          buildSizedBoxHeight(),

                          ///sender name
                          buildTitleOnly(
                              context: context,
                              title: "Sender Name",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerSenderName,
                              hintText: "Name"),
                          buildSizedBoxHeight(),

                          ///Email signature
                          buildTitleAndBody(
                              context: context,
                              title: "Email Signature",
                              body:
                                  "Set the default email signature that will be appended to automated emails and direct emails",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildLongTextFormField(
                              context: context,
                              controller: _controllerEmailSignature,
                              hintText: "Signature"),
                          buildSizedBoxHeight(),

                          /// Language dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Language",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context,
                              selectedText: "Select Language"),
                          buildSizedBoxHeight(),

                          ///Email Header
                          buildTitleAndBody(
                              context: context,
                              title: "Email Header",
                              body:
                                  "Set the default email Header that will be prepended to automated emails and direct emails",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildLongTextFormField(
                              context: context,
                              controller: _controllerEmailHeader,
                              hintText: "Header"),
                          buildSizedBoxHeight(),

                          /// Language dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Language",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context,
                              selectedText: "Select Language"),
                          buildSizedBoxHeight(),

                          ///Notification Icon
                          buildTitleAndBody(
                              context: context,
                              title: "Notification Icon",
                              body:
                                  "Set the default Notification icon. The icon will be used as a profile image if the user soonest have one.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildLongTextFormField(
                              context: context,
                              controller: _controllerNotificationIcon,
                              hintText: "Icon"),
                          buildSizedBoxHeight(),

                          ///Test agent email
                          buildTitleAndBody(
                              context: context,
                              title: "Test agent email",
                              body:
                                  "Set a test agent notification email to verify email settings",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerTestAgentMail,
                              hintText: "Email"),
                          buildSizedBoxHeight(),

                          ///Button
                          buildButton(
                              context: context,
                              buttonName: "Send Email",
                              alignment: Alignment.centerRight),
                          buildSizedBoxHeight(),

                          ///Department
                          buildTitleAndBody(
                              context: context,
                              title: "Departments",
                              body:
                                  "Add and manage additional support departments",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildSizedBoxHeight(),

                          /// sales dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Name",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context, selectedText: "Sales"),
                          buildSizedBoxHeight(),

                          /// Technical dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Name",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context, selectedText: "Technical"),
                          buildSizedBoxHeight(),

                          /// Billing dropdown
                          buildTitleOnly(
                              context: context,
                              title: "Name",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildDropDownButton(
                              context: context, selectedText: "Billing"),
                          buildSizedBoxHeight(),

                          ///button
                          buildButton(
                              context: context,
                              buttonName: "Add New Item",
                              alignment: Alignment.centerLeft),
                          buildSizedBoxHeight(),

                          ///Department settings
                          buildTitleAndBody(
                              context: context,
                              title: "Departments Settings",
                              body: "Manage the department settings",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),

                          ///Display in dashboard
                          buildTitleOnly(
                              context: context,
                              title: "Display in dashboard",
                              isCheckBoxEnabled: true),
                          buildSizedBoxHeight(),

                          ///Display images
                          buildTitleOnly(
                              context: context,
                              title: "Display images",
                              isCheckBoxEnabled: true),
                          buildSizedBoxHeight(),

                          /// label
                          buildTitleOnly(
                              context: context,
                              title: "Label",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerLabel,
                              hintText: "Label"),
                          buildSizedBoxHeight(),

                          ///Single label
                          buildTitleOnly(
                              context: context,
                              title: "Single Label",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerSingleLabel,
                              hintText: "Label"),
                          buildSizedBoxHeight(),

                          ///Dashboard title
                          buildTitleOnly(
                              context: context,
                              title: "Dashboard title",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerDashboardTitle,
                              hintText: "Title"),
                          buildSizedBoxHeight(),

                          ///saved replies
                          buildTitleAndBody(
                              context: context,
                              title: "Saved replies",
                              body: "Add and manage saved replies that can be used by agents in the chat editor. Saved replies can be printed by typing # followed by the reply name plus space.",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),

                          ///name for replies
                          buildTitleOnly(
                              context: context,
                              title: "Name",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerReplyName,
                              hintText: "Name"),
                          buildSizedBoxHeight(),

                          ///text for replies
                          buildTitleOnly(
                              context: context,
                              title: "text",
                              isCheckBoxEnabled: false),
                          buildSizedBoxHeight(),
                          buildTextFormField(
                              context: context,
                              controller: _controllerReplyText,
                              hintText: "Text"),
                          buildSizedBoxHeight(),
                        ],
                      )))
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildButton(
      {required BuildContext context, required String buttonName, required AlignmentGeometry alignment}) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: NeumorphicButton(
          style: NeumorphicStyle(
              color: Theme.of(context).accentColor, depth: 2, intensity: .77),
          onPressed: () {
            setState(() {});
          },
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildLongTextFormField(
      {required BuildContext context,
      required TextEditingController controller,
      required String hintText}) {
    return Neumorphic(
      margin: EdgeInsets.only(left: 0, right: 8, top: 2, bottom: 4),
      style: NeumorphicStyle(
        depth: -3,
        intensity: .77,
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Colors.black38,
        boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(8))),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: TextFormField(
        minLines: 9,
        maxLines: 10,
        controller: controller,
        decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: TextStyle(
                color: NeumorphicTheme.currentTheme(context)
                    .defaultTextColor
                    .withOpacity(.31),
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget buildSizedBoxHeight() {
    return SizedBox(height: spaceDistance);
  }

  Widget buildTextFormField(
      {required BuildContext context,
      required TextEditingController controller,
      required String hintText}) {
    return Neumorphic(
      margin: EdgeInsets.only(left: 0, right: 8, top: 2, bottom: 4),
      style: NeumorphicStyle(
        depth: -3,
        intensity: .77,
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Colors.black38,
        boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(8))),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: TextFormField(
        minLines: 1,
        maxLines: 1,
        controller: controller,
        decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: TextStyle(
                color: NeumorphicTheme.currentTheme(context)
                    .defaultTextColor
                    .withOpacity(.31),
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget buildTitleOnly(
      {required BuildContext context, required String title, required bool isCheckBoxEnabled}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                color: NeumorphicTheme.currentTheme(context).accentColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        isCheckBoxEnabled
            ? Flexible(
                flex: 1,
                child: NeumorphicCheckbox(
                  style: NeumorphicCheckboxStyle(
                      unselectedDepth: 2, selectedDepth: -2),
                  value: check1,
                  onChanged: (value) {
                    setState(() {
                      check1 = value;
                    });
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildTitleAndBody(
      {required BuildContext context,
      required String title,
      required String body,
      required bool isCheckBoxEnabled}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: NeumorphicTheme.currentTheme(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                body,
                style: TextStyle(
                    color:
                        NeumorphicTheme.currentTheme(context).defaultTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          flex: 3,
        ),
        isCheckBoxEnabled
            ? Flexible(
                flex: 1,
                child: NeumorphicCheckbox(
                  style: NeumorphicCheckboxStyle(
                      unselectedDepth: 2, selectedDepth: -2),
                  value: check1,
                  onChanged: (value) {
                    setState(() {
                      check1 = value;
                    });
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildDropDownButton({required BuildContext context, required String selectedText}) {
    return Row(
      children: [
        Expanded(
            child: Align(
          alignment: Alignment.center,
          child: Neumorphic(
            style: NeumorphicStyle(
                depth: 3, intensity: .9, shape: NeumorphicShape.concave),
            child: Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxWidth: MediaQuery.of(context).size.width),
              color: Color(0xFFE5E6EC),
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectedText,
                    style: TextStyle(
                        color: NeumorphicTheme.currentTheme(context)
                            .defaultTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SvgPicture.asset(Assets.downArrow,
                      color: NeumorphicTheme.currentTheme(context)
                          .defaultTextColor),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
