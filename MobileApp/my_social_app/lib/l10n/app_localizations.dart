import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @unexpected_exception.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong! Please try again.'**
  String get unexpected_exception;

  /// No description provided for @votes.
  ///
  /// In en, this message translates to:
  /// **'votes'**
  String get votes;

  /// No description provided for @vote.
  ///
  /// In en, this message translates to:
  /// **'vote'**
  String get vote;

  /// No description provided for @aprove_terms_of_use_page_title.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get aprove_terms_of_use_page_title;

  /// No description provided for @aprove_privacy_policy_page_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get aprove_privacy_policy_page_title;

  /// No description provided for @aprove_privacy_policy_page_checkbox_label.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the privacy policy.'**
  String get aprove_privacy_policy_page_checkbox_label;

  /// No description provided for @approve_terms_of_use_page_checkbox_label.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the terms of use.'**
  String get approve_terms_of_use_page_checkbox_label;

  /// No description provided for @approve_policy_page_eror.
  ///
  /// In en, this message translates to:
  /// **'You must approve the Privacy Policy and Terms of Use to continue!'**
  String get approve_policy_page_eror;

  /// No description provided for @approve_policy_page_button_content.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get approve_policy_page_button_content;

  /// No description provided for @login_form_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or username.'**
  String get login_form_email;

  /// No description provided for @login_form_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get login_form_forgot_password;

  /// No description provided for @login_form_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get login_form_password;

  /// No description provided for @login_form_button.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_form_button;

  /// No description provided for @login_register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get login_register_button;

  /// No description provided for @login_form_email_required_error.
  ///
  /// In en, this message translates to:
  /// **'Email or username is required!'**
  String get login_form_email_required_error;

  /// No description provided for @login_page_diveder_or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get login_page_diveder_or;

  /// No description provided for @face_book_login_button_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong! Please try again.'**
  String get face_book_login_button_error;

  /// No description provided for @google_login_button_error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong! Please try again.'**
  String get google_login_button_error;

  /// No description provided for @register_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email.'**
  String get register_email;

  /// No description provided for @register_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password.'**
  String get register_password;

  /// No description provided for @register_password_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm the password.'**
  String get register_password_confirmation;

  /// No description provided for @register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_button;

  /// No description provided for @register_login_label.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account? Login.'**
  String get register_login_label;

  /// No description provided for @register_login_button.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get register_login_button;

  /// No description provided for @verify_email_form_label.
  ///
  /// In en, this message translates to:
  /// **'We have been sent a mail to confirm your email. Please type the code in the mail.'**
  String get verify_email_form_label;

  /// No description provided for @verify_email_form_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the code.'**
  String get verify_email_form_code;

  /// No description provided for @verify_email_form_button.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verify_email_form_button;

  /// No description provided for @send_email_confirmation_mail_button_content.
  ///
  /// In en, this message translates to:
  /// **'Resend Mail'**
  String get send_email_confirmation_mail_button_content;

  /// No description provided for @send_eamil_confirmation_mail_button_success.
  ///
  /// In en, this message translates to:
  /// **'Email has been successfully send!'**
  String get send_eamil_confirmation_mail_button_success;

  /// No description provided for @send_eamil_confirmation_mail_button_label.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t you receive the email'**
  String get send_eamil_confirmation_mail_button_label;

  /// No description provided for @logout_button_content.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout_button_content;

  /// No description provided for @show_app_dialog_cancel_button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get show_app_dialog_cancel_button;

  /// No description provided for @show_app_dialog_delete_button.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get show_app_dialog_delete_button;

  /// No description provided for @show_logout_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get show_logout_dialog_title;

  /// No description provided for @show_logout_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get show_logout_dialog_content;

  /// No description provided for @show_logout_dialog_content_of_approve_button.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get show_logout_dialog_content_of_approve_button;

  /// No description provided for @show_remove_follower_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Remove Follower'**
  String get show_remove_follower_dialog_title;

  /// No description provided for @show_remove_follower_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the follower?'**
  String get show_remove_follower_dialog_content;

  /// No description provided for @show_remove_follower_dialog_content_of_approve_button.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get show_remove_follower_dialog_content_of_approve_button;

  /// No description provided for @question_state_unsolved.
  ///
  /// In en, this message translates to:
  /// **'Unsolved'**
  String get question_state_unsolved;

  /// No description provided for @question_state_solved.
  ///
  /// In en, this message translates to:
  /// **'Solved'**
  String get question_state_solved;

  /// No description provided for @display_question_likes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get display_question_likes;

  /// No description provided for @no_questions_abstract_items.
  ///
  /// In en, this message translates to:
  /// **'No Questions'**
  String get no_questions_abstract_items;

  /// No description provided for @question_item_popup_menu_delete_action.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get question_item_popup_menu_delete_action;

  /// No description provided for @question_item_popup_menu_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Question'**
  String get question_item_popup_menu_title;

  /// No description provided for @question_item_popup_menu_description.
  ///
  /// In en, this message translates to:
  /// **'Are your sure you want to delete your question?'**
  String get question_item_popup_menu_description;

  /// No description provided for @display_exam_questions_page_exam.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get display_exam_questions_page_exam;

  /// No description provided for @display_question_likes_page_likes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get display_question_likes_page_likes;

  /// No description provided for @display_question_page_title.
  ///
  /// In en, this message translates to:
  /// **'\' s question'**
  String get display_question_page_title;

  /// No description provided for @display_search_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Filtered questions'**
  String get display_search_questions_page_title;

  /// No description provided for @display_subject_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get display_subject_questions_page_title;

  /// No description provided for @display_topic_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get display_topic_questions_page_title;

  /// No description provided for @display_user_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s questions'**
  String get display_user_questions_page_title;

  /// No description provided for @display_user_solved_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s solved questions'**
  String get display_user_solved_questions_page_title;

  /// No description provided for @display_user_unsolved_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s unsolved questions'**
  String get display_user_unsolved_questions_page_title;

  /// No description provided for @display_comment_likes_button_likes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get display_comment_likes_button_likes;

  /// No description provided for @hiide_replies_button.
  ///
  /// In en, this message translates to:
  /// **'Hide replies'**
  String get hiide_replies_button;

  /// No description provided for @reply_comment_button.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply_comment_button;

  /// No description provided for @comment_field_widget_reply_content.
  ///
  /// In en, this message translates to:
  /// **'You are replying to'**
  String get comment_field_widget_reply_content;

  /// No description provided for @comment_field_widget_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Leave a comment...'**
  String get comment_field_widget_hint_text;

  /// No description provided for @comment_popup_menu_delete_action.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get comment_popup_menu_delete_action;

  /// No description provided for @comment_popup_menu_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Comment'**
  String get comment_popup_menu_title;

  /// No description provided for @comment_popup_menu_description.
  ///
  /// In en, this message translates to:
  /// **'Are your sure you want to delete your comment?'**
  String get comment_popup_menu_description;

  /// No description provided for @no_comments_title.
  ///
  /// In en, this message translates to:
  /// **'No Comments'**
  String get no_comments_title;

  /// No description provided for @no_comments_description.
  ///
  /// In en, this message translates to:
  /// **'Be the first to comment.'**
  String get no_comments_description;

  /// No description provided for @display_comment_likes_page_title.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get display_comment_likes_page_title;

  /// No description provided for @notifications_page_title.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications_page_title;

  /// No description provided for @no_notifications_content.
  ///
  /// In en, this message translates to:
  /// **'No Notifications'**
  String get no_notifications_content;

  /// No description provided for @select_exam_page_title.
  ///
  /// In en, this message translates to:
  /// **'Select an exam'**
  String get select_exam_page_title;

  /// No description provided for @select_subject_page_title.
  ///
  /// In en, this message translates to:
  /// **'Select a subject'**
  String get select_subject_page_title;

  /// No description provided for @select_topics_page_title.
  ///
  /// In en, this message translates to:
  /// **'Select topic'**
  String get select_topics_page_title;

  /// No description provided for @select_topics_page_label.
  ///
  /// In en, this message translates to:
  /// **'Select topic'**
  String get select_topics_page_label;

  /// No description provided for @select_topics_page_about_question.
  ///
  /// In en, this message translates to:
  /// **'Type somethings about the question...'**
  String get select_topics_page_about_question;

  /// No description provided for @select_topics_page_topic_error_message.
  ///
  /// In en, this message translates to:
  /// **'You can\'t select up to 3 topics per question'**
  String get select_topics_page_topic_error_message;

  /// No description provided for @select_topics_page_add_medias_button.
  ///
  /// In en, this message translates to:
  /// **'Add Medias'**
  String get select_topics_page_add_medias_button;

  /// No description provided for @add_question_medias_page_title.
  ///
  /// In en, this message translates to:
  /// **'Upload Medias'**
  String get add_question_medias_page_title;

  /// No description provided for @add_question_medias_page_label.
  ///
  /// In en, this message translates to:
  /// **'Upload medias to make your question more visible to other users.'**
  String get add_question_medias_page_label;

  /// No description provided for @create_question_button_content.
  ///
  /// In en, this message translates to:
  /// **'Create Question'**
  String get create_question_button_content;

  /// No description provided for @no_solution_image_widget_label.
  ///
  /// In en, this message translates to:
  /// **'Upload an image to make your solution stand out more.'**
  String get no_solution_image_widget_label;

  /// No description provided for @no_solution_image_widget_add_photo_button.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get no_solution_image_widget_add_photo_button;

  /// No description provided for @add_solution_images_page_error.
  ///
  /// In en, this message translates to:
  /// **'You can\'t upload up to 3 images per a solution!'**
  String get add_solution_images_page_error;

  /// No description provided for @add_solution_images_page_title.
  ///
  /// In en, this message translates to:
  /// **'Create a Solution'**
  String get add_solution_images_page_title;

  /// No description provided for @add_solution_images_page_continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get add_solution_images_page_continue_button;

  /// No description provided for @add_solution_content_page_text_field.
  ///
  /// In en, this message translates to:
  /// **'Type somethings about your solution...'**
  String get add_solution_content_page_text_field;

  /// No description provided for @add_solution_content_page_title.
  ///
  /// In en, this message translates to:
  /// **'Type somethings'**
  String get add_solution_content_page_title;

  /// No description provided for @add_solution_content_page_content_error.
  ///
  /// In en, this message translates to:
  /// **'You have to type a content or upload at least an image!'**
  String get add_solution_content_page_content_error;

  /// No description provided for @add_solution_content_page_content_length_error.
  ///
  /// In en, this message translates to:
  /// **'The content is too long'**
  String get add_solution_content_page_content_length_error;

  /// No description provided for @add_solution_medias_button_content.
  ///
  /// In en, this message translates to:
  /// **'Add Medias'**
  String get add_solution_medias_button_content;

  /// No description provided for @create_solution_button_content.
  ///
  /// In en, this message translates to:
  /// **'Create Solution'**
  String get create_solution_button_content;

  /// No description provided for @edit_user_field_widget_button_text.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit_user_field_widget_button_text;

  /// No description provided for @edit_name_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get edit_name_page_title;

  /// No description provided for @edit_user_name_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Username'**
  String get edit_user_name_page_title;

  /// No description provided for @edit_user_name_page_invalid_characters.
  ///
  /// In en, this message translates to:
  /// **'Invalid chracter!'**
  String get edit_user_name_page_invalid_characters;

  /// No description provided for @edit_biography_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Biography'**
  String get edit_biography_page_title;

  /// No description provided for @edit_biography_page_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Type somethings about you. Which exam are you preparing for?'**
  String get edit_biography_page_hint_text;

  /// No description provided for @edit_profile_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Your Profile'**
  String get edit_profile_page_title;

  /// No description provided for @edit_profile_page_user_name_label.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get edit_profile_page_user_name_label;

  /// No description provided for @edit_profile_page_name_label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get edit_profile_page_name_label;

  /// No description provided for @edit_profile_page_biography_label.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get edit_profile_page_biography_label;

  /// No description provided for @update_profile_photo_modal_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get update_profile_photo_modal_camera;

  /// No description provided for @update_profile_photo_modal_galeri.
  ///
  /// In en, this message translates to:
  /// **'Galeri'**
  String get update_profile_photo_modal_galeri;

  /// No description provided for @update_profile_phot_modal_remove_button.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get update_profile_phot_modal_remove_button;

  /// No description provided for @user_followeds_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s followings'**
  String get user_followeds_page_title;

  /// No description provided for @user_followeds_page_no_followings.
  ///
  /// In en, this message translates to:
  /// **'No Followings'**
  String get user_followeds_page_no_followings;

  /// No description provided for @user_followers_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s followers'**
  String get user_followers_page_title;

  /// No description provided for @user_followers_page_no_followers.
  ///
  /// In en, this message translates to:
  /// **'No Followers'**
  String get user_followers_page_no_followers;

  /// No description provided for @user_page_label_all.
  ///
  /// In en, this message translates to:
  /// **'all'**
  String get user_page_label_all;

  /// No description provided for @user_page_label_solved.
  ///
  /// In en, this message translates to:
  /// **'solved'**
  String get user_page_label_solved;

  /// No description provided for @user_page_label_unsolved.
  ///
  /// In en, this message translates to:
  /// **'unsolved'**
  String get user_page_label_unsolved;

  /// No description provided for @message_items_new_messages.
  ///
  /// In en, this message translates to:
  /// **'new messages'**
  String get message_items_new_messages;

  /// No description provided for @message_items_new_message.
  ///
  /// In en, this message translates to:
  /// **'new message'**
  String get message_items_new_message;

  /// No description provided for @conversation_page_message_field_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Message ...'**
  String get conversation_page_message_field_hint_text;

  /// No description provided for @conversation_page_delete_cancel_button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get conversation_page_delete_cancel_button;

  /// No description provided for @conversation_page_delete_button.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get conversation_page_delete_button;

  /// No description provided for @conversation_page_delete_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Messages'**
  String get conversation_page_delete_dialog_title;

  /// No description provided for @conversation_page_delete_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your messages?'**
  String get conversation_page_delete_dialog_content;

  /// No description provided for @messages_home_page_title.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages_home_page_title;

  /// No description provided for @create_message_images_page_media_count_error.
  ///
  /// In en, this message translates to:
  /// **'You cannot upload more than 5 media in a message.'**
  String get create_message_images_page_media_count_error;

  /// No description provided for @conversation_item.
  ///
  /// In en, this message translates to:
  /// **'Image ...'**
  String get conversation_item;

  /// No description provided for @create_message_images_page_message_field_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Message ...'**
  String get create_message_images_page_message_field_hint_text;

  /// No description provided for @comment_liked_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Your comment has been liked.'**
  String get comment_liked_notification_item_content;

  /// No description provided for @comment_replied_notification_content.
  ///
  /// In en, this message translates to:
  /// **'Your comment has been replied.'**
  String get comment_replied_notification_content;

  /// No description provided for @question_comment_created_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Your question has been commented.'**
  String get question_comment_created_notification_item_content;

  /// No description provided for @question_liked_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Your question has been liked.'**
  String get question_liked_notification_item_content;

  /// No description provided for @question_solved_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'YAY!!!🥳 Your question has been solved. Click to display the solution.'**
  String get question_solved_notification_item_content;

  /// No description provided for @solution_comment_created_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Your solution has been commented.'**
  String get solution_comment_created_notification_item_content;

  /// No description provided for @solution_created_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'A solution has been created for your question.😊👊 Click to check the solution.'**
  String get solution_created_notification_item_content;

  /// No description provided for @solution_marked_as_correct_notification_item_context.
  ///
  /// In en, this message translates to:
  /// **'Your solution has been marked as correct.👏👏👏'**
  String get solution_marked_as_correct_notification_item_context;

  /// No description provided for @solution_marked_as_incorrect_notification_imte_content.
  ///
  /// In en, this message translates to:
  /// **'Your solution has been marked as incorrect!😓'**
  String get solution_marked_as_incorrect_notification_imte_content;

  /// No description provided for @solutin_was_downvoted_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Oh No🙁 Your solution has been downvoted!👎'**
  String get solutin_was_downvoted_notification_item_content;

  /// No description provided for @solution_was_upvoted_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'Hey!!! Your solution has been upvoted!👍'**
  String get solution_was_upvoted_notification_item_content;

  /// No description provided for @user_followed_notification_item_content.
  ///
  /// In en, this message translates to:
  /// **'You have a new follower.'**
  String get user_followed_notification_item_content;

  /// No description provided for @user_tagged_in_comment_item_content.
  ///
  /// In en, this message translates to:
  /// **'You have been tagged in a comment.'**
  String get user_tagged_in_comment_item_content;

  /// No description provided for @search_question_widget_select_exam.
  ///
  /// In en, this message translates to:
  /// **'Select Exam'**
  String get search_question_widget_select_exam;

  /// No description provided for @search_question_widget_select_subject.
  ///
  /// In en, this message translates to:
  /// **'Select Subject'**
  String get search_question_widget_select_subject;

  /// No description provided for @search_question_widget_select_topic.
  ///
  /// In en, this message translates to:
  /// **'Select Topic'**
  String get search_question_widget_select_topic;

  /// No description provided for @search_users_widget_search_field_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_users_widget_search_field_hint_text;

  /// No description provided for @search_page_label_question.
  ///
  /// In en, this message translates to:
  /// **'questions'**
  String get search_page_label_question;

  /// No description provided for @search_page_label_user.
  ///
  /// In en, this message translates to:
  /// **'users'**
  String get search_page_label_user;

  /// No description provided for @image_not_font_widget_content.
  ///
  /// In en, this message translates to:
  /// **'Image not Found.'**
  String get image_not_font_widget_content;

  /// No description provided for @display_question_correct_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Correct solutions'**
  String get display_question_correct_solutions_page_title;

  /// No description provided for @display_question_correct_solutions_page_no_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Correct Solutions'**
  String get display_question_correct_solutions_page_no_solutions;

  /// No description provided for @display_question_incorrect_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Incorrect solutions'**
  String get display_question_incorrect_solutions_page_title;

  /// No description provided for @display_question_incorrect_solutions_page_not_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Incorrect Solutions'**
  String get display_question_incorrect_solutions_page_not_solutions;

  /// No description provided for @display_question_pending_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Pending solutions'**
  String get display_question_pending_solutions_page_title;

  /// No description provided for @display_question_pending_solutions_page_no_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Pending Solutions'**
  String get display_question_pending_solutions_page_no_solutions;

  /// No description provided for @display_question_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Question Solutions'**
  String get display_question_solutions_page_title;

  /// No description provided for @display_solutions_downvote_page_title.
  ///
  /// In en, this message translates to:
  /// **'Downvotes'**
  String get display_solutions_downvote_page_title;

  /// No description provided for @display_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'\'s solutions'**
  String get display_solutions_page_title;

  /// No description provided for @display_solution_upvotes_title.
  ///
  /// In en, this message translates to:
  /// **'Upvotes'**
  String get display_solution_upvotes_title;

  /// No description provided for @display_video_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Video Solutions'**
  String get display_video_solutions_page_title;

  /// No description provided for @display_video_solutions_page_no_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Video Solutions'**
  String get display_video_solutions_page_no_solutions;

  /// No description provided for @display_question_solutions_page_no_correct_solutins.
  ///
  /// In en, this message translates to:
  /// **'No Correct Solutions'**
  String get display_question_solutions_page_no_correct_solutins;

  /// No description provided for @display_question_solutions_page_no_pending_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Pending Solutions'**
  String get display_question_solutions_page_no_pending_solutions;

  /// No description provided for @display_question_solutions_page_no_incorrect_solutions.
  ///
  /// In en, this message translates to:
  /// **'No Incorrect Solutions'**
  String get display_question_solutions_page_no_incorrect_solutions;

  /// No description provided for @create_question_speed_dial_video_solution_label.
  ///
  /// In en, this message translates to:
  /// **'Create Video Solution'**
  String get create_question_speed_dial_video_solution_label;

  /// No description provided for @create_question_speed_dial_image_solution_label.
  ///
  /// In en, this message translates to:
  /// **'Upload Images'**
  String get create_question_speed_dial_image_solution_label;

  /// No description provided for @no_solutions_widget_conten1.
  ///
  /// In en, this message translates to:
  /// **'No Solutions Yet!!!😢'**
  String get no_solutions_widget_conten1;

  /// No description provided for @no_solutions_widget_conten2.
  ///
  /// In en, this message translates to:
  /// **'Dont Worry! Your question will be solved soon.🤞'**
  String get no_solutions_widget_conten2;

  /// No description provided for @no_solutions_widget_conten3.
  ///
  /// In en, this message translates to:
  /// **'No Solutions Yet!!!😢'**
  String get no_solutions_widget_conten3;

  /// No description provided for @no_solutions_widget_conten4.
  ///
  /// In en, this message translates to:
  /// **'Be the first to solve this question.👍'**
  String get no_solutions_widget_conten4;

  /// No description provided for @solution_popup_menu_titte.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Solution'**
  String get solution_popup_menu_titte;

  /// No description provided for @solution_popup_menu_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your solution?'**
  String get solution_popup_menu_content;

  /// No description provided for @solution_popup_menu_delete_button.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get solution_popup_menu_delete_button;

  /// No description provided for @mark_solution_as_correct_button_content.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get mark_solution_as_correct_button_content;

  /// No description provided for @mark_solution_as_incorrect_button_content.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get mark_solution_as_incorrect_button_content;

  /// No description provided for @follow_button_widget_unfollow.
  ///
  /// In en, this message translates to:
  /// **'unfollow'**
  String get follow_button_widget_unfollow;

  /// No description provided for @follow_button_widget_follow.
  ///
  /// In en, this message translates to:
  /// **'follow'**
  String get follow_button_widget_follow;

  /// No description provided for @message_button_widget_content.
  ///
  /// In en, this message translates to:
  /// **'message'**
  String get message_button_widget_content;

  /// No description provided for @profile_edit_button_content.
  ///
  /// In en, this message translates to:
  /// **'Edit your profile'**
  String get profile_edit_button_content;

  /// No description provided for @remove_follower_button_content.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove_follower_button_content;

  /// No description provided for @user_info_header_widget_questions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get user_info_header_widget_questions;

  /// No description provided for @user_info_header_widget_followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get user_info_header_widget_followers;

  /// No description provided for @user_info_header_widget_followings.
  ///
  /// In en, this message translates to:
  /// **'Followings'**
  String get user_info_header_widget_followings;

  /// No description provided for @profile_menu_page_title.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get profile_menu_page_title;

  /// No description provided for @profile_menu_page_saves_item.
  ///
  /// In en, this message translates to:
  /// **'Questions Saved'**
  String get profile_menu_page_saves_item;

  /// No description provided for @profile_menu_page_logout_item.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profile_menu_page_logout_item;

  /// No description provided for @delete_account_menu_item_content.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get delete_account_menu_item_content;

  /// No description provided for @delete_account_menu_item_app_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Account'**
  String get delete_account_menu_item_app_dialog_title;

  /// No description provided for @delete_account_menu_item_app_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your acccount!. We are so sorry to see you leave us!'**
  String get delete_account_menu_item_app_dialog_content;

  /// No description provided for @display_saved_solutions_menu_item_name.
  ///
  /// In en, this message translates to:
  /// **'Saved Solutions'**
  String get display_saved_solutions_menu_item_name;

  /// No description provided for @change_language_menu_item_name.
  ///
  /// In en, this message translates to:
  /// **'Change Language of The Application'**
  String get change_language_menu_item_name;

  /// No description provided for @display_abstract_saved_questions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Questions Saved'**
  String get display_abstract_saved_questions_page_title;

  /// No description provided for @display_abstract_saved_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Solutions Saved'**
  String get display_abstract_saved_solutions_page_title;

  /// No description provided for @display_abstract_saved_solutions_page_no_solutions_content.
  ///
  /// In en, this message translates to:
  /// **'No Solutions Saved'**
  String get display_abstract_saved_solutions_page_no_solutions_content;

  /// No description provided for @display_saved_solutions_page_title.
  ///
  /// In en, this message translates to:
  /// **'Solutions Saved'**
  String get display_saved_solutions_page_title;

  /// No description provided for @display_saved_question_page_title.
  ///
  /// In en, this message translates to:
  /// **'Questions Saved'**
  String get display_saved_question_page_title;

  /// No description provided for @create_conversation_page_title.
  ///
  /// In en, this message translates to:
  /// **'Create a new conversation'**
  String get create_conversation_page_title;

  /// No description provided for @message_home_page_delete_conversations_title.
  ///
  /// In en, this message translates to:
  /// **'Delete Conversations'**
  String get message_home_page_delete_conversations_title;

  /// No description provided for @message_home_page_delete_conversations_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the conversations?'**
  String get message_home_page_delete_conversations_content;

  /// No description provided for @message_home_page_content_aprove_button.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get message_home_page_content_aprove_button;

  /// No description provided for @delete_conversations_button.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get delete_conversations_button;

  /// No description provided for @cancel_deletion_of_conversations_button.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel_deletion_of_conversations_button;

  /// No description provided for @take_video_page_duration_exception.
  ///
  /// In en, this message translates to:
  /// **'The duration of the video must be shorter than 5 minutes'**
  String get take_video_page_duration_exception;

  /// No description provided for @add_solution_medias_content.
  ///
  /// In en, this message translates to:
  /// **'Make your solution stand out by adding media.'**
  String get add_solution_medias_content;

  /// No description provided for @uploading_solution_abstract_item.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get uploading_solution_abstract_item;

  /// No description provided for @uploading_solution_abstract_item_failed_content.
  ///
  /// In en, this message translates to:
  /// **'Failed! Click to try again.'**
  String get uploading_solution_abstract_item_failed_content;

  /// No description provided for @uploading_circle_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get uploading_circle_processing;

  /// No description provided for @uploading_circle_failed_content.
  ///
  /// In en, this message translates to:
  /// **'Failed! Click to try again.'**
  String get uploading_circle_failed_content;

  /// No description provided for @update_page_app_button_content.
  ///
  /// In en, this message translates to:
  /// **'Update App'**
  String get update_page_app_button_content;

  /// No description provided for @update_page_app_content.
  ///
  /// In en, this message translates to:
  /// **'A new version available. You need to update the app to continue using it!'**
  String get update_page_app_content;

  /// No description provided for @generate_password_reset_token_form_email_required_error.
  ///
  /// In en, this message translates to:
  /// **'Email is required!'**
  String get generate_password_reset_token_form_email_required_error;

  /// No description provided for @generate_password_reset_token_form_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Type your email.'**
  String get generate_password_reset_token_form_placeholder;

  /// No description provided for @generate_password_reset_token_send_email_button_content.
  ///
  /// In en, this message translates to:
  /// **'Send reset password mail.'**
  String get generate_password_reset_token_send_email_button_content;

  /// No description provided for @generate_password_reset_token_email_created_notification_message.
  ///
  /// In en, this message translates to:
  /// **'Password reset email has been sent successfully.'**
  String get generate_password_reset_token_email_created_notification_message;

  /// No description provided for @token_form_field_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter the code.'**
  String get token_form_field_placeholder;

  /// No description provided for @token_form_field_token_required_error_message.
  ///
  /// In en, this message translates to:
  /// **'Token is required!'**
  String get token_form_field_token_required_error_message;

  /// No description provided for @token_form_field_token_length_error_message.
  ///
  /// In en, this message translates to:
  /// **'Token must be 6 characters long.'**
  String get token_form_field_token_length_error_message;

  /// No description provided for @password_required_validation.
  ///
  /// In en, this message translates to:
  /// **'Password is required!'**
  String get password_required_validation;

  /// No description provided for @password_confirm_required_validation.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is required!'**
  String get password_confirm_required_validation;

  /// No description provided for @password_length_validation.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be shorter than 6 characters!'**
  String get password_length_validation;

  /// No description provided for @password_and_password_cofirm_validation.
  ///
  /// In en, this message translates to:
  /// **'Password and password confirmation do not match!'**
  String get password_and_password_cofirm_validation;

  /// No description provided for @email_required_validation.
  ///
  /// In en, this message translates to:
  /// **'Email is required!'**
  String get email_required_validation;

  /// No description provided for @email_invalid_validation.
  ///
  /// In en, this message translates to:
  /// **'Email is invalid!'**
  String get email_invalid_validation;

  /// No description provided for @reset_password_form_button_content.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get reset_password_form_button_content;

  /// No description provided for @reset_password_form_success_content.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully.'**
  String get reset_password_form_success_content;

  /// No description provided for @take_video_speed_dial_gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get take_video_speed_dial_gallery;

  /// No description provided for @take_video_speed_dial_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get take_video_speed_dial_camera;

  /// No description provided for @create_solution_speed_dial_label.
  ///
  /// In en, this message translates to:
  /// **'Create Solution'**
  String get create_solution_speed_dial_label;

  /// No description provided for @upload_status_widget_uploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading'**
  String get upload_status_widget_uploading;

  /// No description provided for @upload_status_widget_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get upload_status_widget_processing;

  /// No description provided for @upload_status_widget_uploading_success.
  ///
  /// In en, this message translates to:
  /// **'Upload sucessful'**
  String get upload_status_widget_uploading_success;

  /// No description provided for @upload_status_widget_uploading_failed.
  ///
  /// In en, this message translates to:
  /// **'Upload failed! Click to try again.'**
  String get upload_status_widget_uploading_failed;

  /// No description provided for @create_solution_by_ai_button_label.
  ///
  /// In en, this message translates to:
  /// **'Let artificial intelligence solve it!'**
  String get create_solution_by_ai_button_label;

  /// No description provided for @ai_item_modal_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get ai_item_modal_title;

  /// No description provided for @ai_item_modal_content.
  ///
  /// In en, this message translates to:
  /// **'Artificial intelligence does not guarantee to provide correct solutions for questions.Do you accept this?'**
  String get ai_item_modal_content;

  /// No description provided for @ai_item_modal_create_solution_button.
  ///
  /// In en, this message translates to:
  /// **'Accept it'**
  String get ai_item_modal_create_solution_button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
