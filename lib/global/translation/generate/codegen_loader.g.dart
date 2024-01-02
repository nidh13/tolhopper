// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> nl = {
  "my_app_name": "Toll Hopper",
  "skip_text": "Skip",
  "register": {
    "title": "Let’s get started",
    "sub_title": "Fill basic details to continue",
    "gender_title": "Salutaion",
    "gender_hint": "Select",
    "first_name_title": "First Name",
    "first_name_hint": "Enter your first Name",
    "last_name_title": "Last Name",
    "last_name_hint": "Entre your last name",
    "email_title": "Email",
    "email_hint": "Enter your email here",
    "password_title": "Password",
    "re_password_title": "Repeat Password",
    "re_password_hint": "Re-enter your password",
    "password_hint": "Entre your password",
    "checkbox_text": "By continuing you agree to toll hopper Terms and conditions, Privacy Policy.",
    "button_text": "Register",
    "gender_nothing": "Nothing",
    "gender_male": "Mr",
    "gender_female": "Mrs",
    "success_message": "your account has been created successfully"
  },
  "login": {
    "title": "Sign in",
    "keep_login": "Keep me logged in",
    "forget_password": "Forgot Password?",
    "dont_have_account": "Don’t have an account?",
    "register_here": "Register here",
    "or_sign_in_with": "Or Sign in with",
    "continue_as_guest": "Continue as a guest"
  },
  "home": {
    "home_bar": "Home",
    "route_plan": "Route Plan",
    "cart": "Cart",
    "calculator": "Toll Calculator",
    "news": "News"
  },
  "route_plan": {
    "app_bar_title": "Route Planner",
    "search": "Search",
    "input_label": "Please enter your desired location",
    "input_hint": "Enter Location"
  },
  "home_tab": {
    "title": "Find your packages",
    "choose": "Choose",
    "validity_text": "Valid Immediately Or Later If Desired."
  },
  "cart_tab": {
    "checkout": "Checkout",
    "app_bar_title": "Cart",
    "empty_cart_text": "Your Cart is Empty"
  },
  "calculator_tab": {
    "start": "Start",
    "destination": "Destination",
    "start_date": "Start Date",
    "end_date": "End Date",
    "select_date_hint": "Select Date",
    "select_car_hint": "Select Vehicle Type",
    "app_bar_title": "Toll Calculator"
  },
  "route_trajectory": {
    "app_bar_title": "Route Trajectory",
    "see_on_map": "See on map"
  },
  "toll_selection": {
    "app_bar_title": "Your Trip",
    "vignette": "Vignette",
    "tolls": "Tolls",
    "start": "Start",
    "end": "End",
    "digital_vignette": "Digital Vignette",
    "digital_toll": "Digital Route Toll",
    "return_text": "Book return toll fee"
  },
  "license_information": {
    "app_bar_title": "License Plate Information",
    "plate_number": "License Plate Number",
    "plate_number_hint": "EnterLicense Plate Number",
    "confirm_plate_number": "Confirm License Plate Number",
    "car_name": "Car Name",
    "car_name_hint": "Enter name here",
    "car_model": "Car Model",
    "car_model_hint": "Enter car model here",
    "car_energy": "Car Energy",
    "car_energy_hint": "Select"
  },
  "car_energy": {
    "gasoline": "Gasoline",
    "diesel": "Diesel",
    "electric": "Electric",
    "hybrid": "Hybrid",
    "pluginHybrid": "Plug-in hybrid",
    "hydrogen": "Hydrogen"
  },
  "cancel": "Cancel",
  "next": "Next",
  "choose": "Choose",
  "save": "Save",
  "contact_information": {
    "app_bar_title": "Contact Information",
    "request_an_invoice": "Request an invoice",
    "confirm_email": "Confirm Email",
    "company_name_title": "Company Name",
    "company_name_hint": "Entre name here",
    "country_title": "Country",
    "country_hint": "Entre country Here",
    "city_title": "City",
    "city_hint": "Entre city Here",
    "address_title": "Address",
    "address_hint": "Enter address here",
    "house_num_title": "House No",
    "house_num_hint": "Enter here",
    "postal_code_title": "Postal Code",
    "postal_code_hint": "Enter here",
    "create_account": "Create an account?",
    "set_password": "Set Password"
  },
  "payment_method": {
    "app_bar_title": "Payment Method",
    "proceed_to_checkout": "Proceed to Checkout",
    "credit_card": "Credit Card",
    "paypal": "Paypal",
    "klarna": "Klarna",
    "sofort_uberweisung": "Sofort Überweisung"
  },
  "checkout": {
    "app_bar_title": "Checkout",
    "name_label": "Name",
    "license_pate_number": "License Plate No.",
    "date_time": "Date & Time",
    "order_summary": "Order Summary",
    "package": "Package",
    "additional_fee": "Additional fee",
    "sub_total": "Sub total",
    "total_amount": "Total amount",
    "checkout": "Checkout"
  },
  "order_summary": {
    "app_bar_title": "Order Summary",
    "congratulation": "Congratulations",
    "success_message": "Your order has been sucessfully placed",
    "back_to_home": "Back to Homepage"
  },
  "drawer": {
    "account_settings": "Account Settings",
    "vignette": "Vignettes",
    "payment": "Payments",
    "notification": "Notification",
    "settings": "Settings",
    "imprint": "Imprint",
    "support": "Support",
    "term_conditions": "Terms & Conditions",
    "privacy": "Privacy Policy",
    "sign_out": "Sign out"
  },
  "news": {
    "app_bar_title": "News",
    "read_more": "Read more"
  },
  "vignettes": {
    "app_bar_title": "Vignettes",
    "active": "Active",
    "expired": "Expired",
    "downloadPdf": "Download PDF",
    "extend": "Extend",
    "order_date": "Order Date",
    "validity_date": "Validity Date"
  },
  "personal_settings": {
    "personal_details": "Personal Details",
    "company_details": "Company Details"
  },
  "validation": {
    "password": "Please enter valid password",
    "email": "Please enter valid email address",
    "password_misMatch": "Please ensure both password fields have the same value.",
    "required_filed": "Please fill in the required field.",
    "validate_gender": "Please fill in the required field."
  },
  "server": {
    "credentials_exception": "Invalid credentials.",
    "customer_exist_exception": "Customer already exist.",
    "internal_exception": "Oops! Something went wrong on our end. Please try again later.",
    "internet_exception": "No internet connection. Please check your network settings and try again.",
    "unexpected_exception": "An unexpected error occurred. Please try again later or contact support for assistance.",
    "user_not_exist": "Customer is not exist.",
    "try_again": "Try Again",
    "no_route_text": "There is no results"
  },
  "reset_password": {
    "hint": "Please enter your e-mail address with which you registered",
    "app_bar_title": "Reset Password",
    "send": "Send",
    "success_message": "Please check your email inbox."
  },
  "log_out_pop_up": {
    "content": "Are you sure you want to log out?",
    "title": "Logout",
    "confirm_text": "Logout",
    "cancel_text": "Cancel"
  },
  "not_available_product": {
    "coming_soon_text": "You cannot currently purchase any products from us for this route.",
    "coming_soon_title": "Coming Soon!",
    "text": "There are no fees for the route you have chosen!",
    "title": "FREE RIDE!"
  },
  "one_option_dialog": {
    "date_error": "Start date should be before end date",
    "title": "Notice",
    "button_text": "Ok"
  },
  "defined_countries": {
    "austria": "Austria",
    "slovenia": "Slovenia"
  }
};
static const Map<String,dynamic> de = {
  "my_app_name": "Toll Hopper",
  "skip_text": "Skip",
  "register": {
    "title": "Let’s get started",
    "sub_title": "Fill basic details to continue",
    "gender_title": "Salutaion",
    "gender_hint": "Select",
    "first_name_title": "First Name",
    "first_name_hint": "Enter your first Name",
    "last_name_title": "Last Name",
    "last_name_hint": "Entre your last name",
    "email_title": "Email",
    "email_hint": "Enter your email here",
    "password_title": "Password",
    "re_password_title": "Repeat Password",
    "re_password_hint": "Re-enter your password",
    "password_hint": "Entre your password",
    "checkbox_text": "By continuing you agree to toll hopper Terms and conditions, Privacy Policy.",
    "button_text": "Register",
    "gender_nothing": "Nothing",
    "gender_male": "Mr",
    "gender_female": "Mrs",
    "success_message": "your account has been created successfully"
  },
  "login": {
    "title": "Sign in",
    "keep_login": "Keep me logged in",
    "forget_password": "Forgot Password?",
    "dont_have_account": "Don’t have an account?",
    "register_here": "Register here",
    "or_sign_in_with": "Or Sign in with",
    "continue_as_guest": "Continue as a guest"
  },
  "home": {
    "home_bar": "Home",
    "route_plan": "Route Plan",
    "cart": "Cart",
    "calculator": "Toll Calculator",
    "news": "News"
  },
  "route_plan": {
    "app_bar_title": "Route Planner",
    "search": "Search",
    "input_label": "Please enter your desired location",
    "input_hint": "Enter Location"
  },
  "home_tab": {
    "title": "Find your packages",
    "choose": "Choose",
    "validity_text": "Valid Immediately Or Later If Desired."
  },
  "cart_tab": {
    "checkout": "Checkout",
    "app_bar_title": "Cart",
    "empty_cart_text": "Your Cart is Empty"
  },
  "calculator_tab": {
    "start": "Start",
    "destination": "Destination",
    "start_date": "Start Date",
    "end_date": "End Date",
    "select_date_hint": "Select Date",
    "select_car_hint": "Select Vehicle Type",
    "app_bar_title": "Toll Calculator"
  },
  "route_trajectory": {
    "app_bar_title": "Route Trajectory",
    "see_on_map": "See on map"
  },
  "toll_selection": {
    "app_bar_title": "Your Trip",
    "vignette": "Vignette",
    "tolls": "Tolls",
    "start": "Start",
    "end": "End",
    "digital_vignette": "Digital Vignette",
    "digital_toll": "Digital Route Toll",
    "return_text": "Book return toll fee"
  },
  "license_information": {
    "app_bar_title": "License Plate Information",
    "plate_number": "License Plate Number",
    "plate_number_hint": "EnterLicense Plate Number",
    "confirm_plate_number": "Confirm License Plate Number",
    "car_name": "Car Name",
    "car_name_hint": "Enter name here",
    "car_model": "Car Model",
    "car_model_hint": "Enter car model here",
    "car_energy": "Car Energy",
    "car_energy_hint": "Select"
  },
  "car_energy": {
    "gasoline": "Gasoline",
    "diesel": "Diesel",
    "electric": "Electric",
    "hybrid": "Hybrid",
    "pluginHybrid": "Plug-in hybrid",
    "hydrogen": "Hydrogen"
  },
  "cancel": "Cancel",
  "next": "Next",
  "choose": "Choose",
  "save": "Save",
  "contact_information": {
    "app_bar_title": "Contact Information",
    "request_an_invoice": "Request an invoice",
    "confirm_email": "Confirm Email",
    "company_name_title": "Company Name",
    "company_name_hint": "Entre name here",
    "country_title": "Country",
    "country_hint": "Entre country Here",
    "city_title": "City",
    "city_hint": "Entre city Here",
    "address_title": "Address",
    "address_hint": "Enter address here",
    "house_num_title": "House No",
    "house_num_hint": "Enter here",
    "postal_code_title": "Postal Code",
    "postal_code_hint": "Enter here",
    "create_account": "Create an account?",
    "set_password": "Set Password"
  },
  "payment_method": {
    "app_bar_title": "Payment Method",
    "proceed_to_checkout": "Proceed to Checkout",
    "credit_card": "Credit Card",
    "paypal": "Paypal",
    "klarna": "Klarna",
    "sofort_uberweisung": "Sofort Überweisung"
  },
  "checkout": {
    "app_bar_title": "Checkout",
    "name_label": "Name",
    "license_pate_number": "License Plate No.",
    "date_time": "Date & Time",
    "order_summary": "Order Summary",
    "package": "Package",
    "additional_fee": "Additional fee",
    "sub_total": "Sub total",
    "total_amount": "Total amount",
    "checkout": "Checkout"
  },
  "order_summary": {
    "app_bar_title": "Order Summary",
    "congratulation": "Congratulations",
    "success_message": "Your order has been sucessfully placed",
    "back_to_home": "Back to Homepage"
  },
  "drawer": {
    "account_settings": "Account Settings",
    "vignette": "Vignettes",
    "payment": "Payments",
    "notification": "Notification",
    "settings": "Settings",
    "imprint": "Imprint",
    "support": "Support",
    "term_conditions": "Terms & Conditions",
    "privacy": "Privacy Policy",
    "sign_out": "Sign out"
  },
  "news": {
    "app_bar_title": "News",
    "read_more": "Read more"
  },
  "vignettes": {
    "app_bar_title": "Vignettes",
    "active": "Active",
    "expired": "Expired",
    "downloadPdf": "Download PDF",
    "extend": "Extend",
    "order_date": "Order Date",
    "validity_date": "Validity Date"
  },
  "personal_settings": {
    "personal_details": "Personal Details",
    "company_details": "Company Details"
  },
  "validation": {
    "password": "Please enter valid password",
    "email": "Please enter valid email address",
    "password_misMatch": "Please ensure both password fields have the same value.",
    "required_filed": "Please fill in the required field.",
    "validate_gender": "Please fill in the required field."
  },
  "server": {
    "credentials_exception": "Invalid credentials.",
    "customer_exist_exception": "Customer already exist.",
    "internal_exception": "Oops! Something went wrong on our end. Please try again later.",
    "internet_exception": "No internet connection. Please check your network settings and try again.",
    "unexpected_exception": "An unexpected error occurred. Please try again later or contact support for assistance.",
    "user_not_exist": "Customer is not exist.",
    "try_again": "Try Again",
    "no_route_text": "There is no results"
  },
  "reset_password": {
    "hint": "Please enter your e-mail address with which you registered",
    "app_bar_title": "Reset Password",
    "send": "Send",
    "success_message": "Please check your email inbox."
  },
  "log_out_pop_up": {
    "content": "Are you sure you want to log out?",
    "title": "Logout",
    "confirm_text": "Logout",
    "cancel_text": "Cancel"
  },
  "not_available_product": {
    "coming_soon_text": "You cannot currently purchase any products from us for this route.",
    "coming_soon_title": "Coming Soon!",
    "text": "There are no fees for the route you have chosen!",
    "title": "FREE RIDE!"
  },
  "one_option_dialog": {
    "date_error": "Start date should be before end date",
    "title": "Notice",
    "button_text": "Ok"
  },
  "defined_countries": {
    "austria": "Österreich",
    "slovenia": "Slowenien"
  }
};
static const Map<String,dynamic> en = {
  "my_app_name": "Toll Hopper",
  "skip_text": "Skip",
  "register": {
    "title": "Let’s get started",
    "sub_title": "Fill basic details to continue",
    "gender_title": "Salutaion",
    "gender_hint": "Select",
    "first_name_title": "First Name",
    "first_name_hint": "Enter your first Name",
    "last_name_title": "Last Name",
    "last_name_hint": "Entre your last name",
    "email_title": "Email",
    "email_hint": "Enter your email here",
    "password_title": "Password",
    "re_password_title": "Repeat Password",
    "re_password_hint": "Re-enter your password",
    "password_hint": "Entre your password",
    "checkbox_text": "By continuing you agree to toll hopper Terms and conditions, Privacy Policy.",
    "button_text": "Register",
    "gender_nothing": "Nothing",
    "gender_male": "Mr",
    "gender_female": "Mrs",
    "success_message": "your account has been created successfully"
  },
  "login": {
    "title": "Sign in",
    "keep_login": "Keep me logged in",
    "forget_password": "Forgot Password?",
    "dont_have_account": "Don’t have an account?",
    "register_here": "Register here",
    "or_sign_in_with": "Or Sign in with",
    "continue_as_guest": "Continue as a guest"
  },
  "home": {
    "home_bar": "Home",
    "route_plan": "Route Plan",
    "cart": "Cart",
    "calculator": "Toll Calculator",
    "news": "News"
  },
  "route_plan": {
    "app_bar_title": "Route Planner",
    "search": "Search",
    "input_label": "Please enter your desired location",
    "input_hint": "Enter Location"
  },
  "home_tab": {
    "title": "Find your packages",
    "choose": "Choose",
    "validity_text": "Valid Immediately Or Later If Desired."
  },
  "cart_tab": {
    "checkout": "Checkout",
    "app_bar_title": "Cart",
    "empty_cart_text": "Your Cart is Empty"
  },
  "calculator_tab": {
    "start": "Start",
    "destination": "Destination",
    "start_date": "Start Date",
    "end_date": "End Date",
    "select_date_hint": "Select Date",
    "select_car_hint": "Select Vehicle Type",
    "app_bar_title": "Toll Calculator"
  },
  "route_trajectory": {
    "app_bar_title": "Route Trajectory",
    "see_on_map": "See on map"
  },
  "toll_selection": {
    "app_bar_title": "Your Trip",
    "vignette": "Vignette",
    "tolls": "Tolls",
    "start": "Start",
    "end": "End",
    "digital_vignette": "Digital Vignette",
    "digital_toll": "Digital Route Toll",
    "return_text": "Book return toll fee"
  },
  "license_information": {
    "app_bar_title": "License Plate Information",
    "plate_number": "License Plate Number",
    "plate_number_hint": "EnterLicense Plate Number",
    "confirm_plate_number": "Confirm License Plate Number",
    "car_name": "Car Name",
    "car_name_hint": "Enter name here",
    "car_model": "Car Model",
    "car_model_hint": "Enter car model here",
    "car_energy": "Car Energy",
    "car_energy_hint": "Select"
  },
  "car_energy": {
    "gasoline": "Gasoline",
    "diesel": "Diesel",
    "electric": "Electric",
    "hybrid": "Hybrid",
    "pluginHybrid": "Plug-in hybrid",
    "hydrogen": "Hydrogen"
  },
  "cancel": "Cancel",
  "next": "Next",
  "choose": "Choose",
  "save": "Save",
  "contact_information": {
    "app_bar_title": "Contact Information",
    "request_an_invoice": "Request an invoice",
    "confirm_email": "Confirm Email",
    "company_name_title": "Company Name",
    "company_name_hint": "Entre name here",
    "country_title": "Country",
    "country_hint": "Entre country Here",
    "city_title": "City",
    "city_hint": "Entre city Here",
    "address_title": "Address",
    "address_hint": "Enter address here",
    "house_num_title": "House No",
    "house_num_hint": "Enter here",
    "postal_code_title": "Postal Code",
    "postal_code_hint": "Enter here",
    "create_account": "Create an account?",
    "set_password": "Set Password"
  },
  "payment_method": {
    "app_bar_title": "Payment Method",
    "proceed_to_checkout": "Proceed to Checkout",
    "credit_card": "Credit Card",
    "paypal": "Paypal",
    "klarna": "Klarna",
    "sofort_uberweisung": "Sofort Überweisung"
  },
  "checkout": {
    "app_bar_title": "Checkout",
    "name_label": "Name",
    "license_pate_number": "License Plate No.",
    "date_time": "Date & Time",
    "order_summary": "Order Summary",
    "package": "Package",
    "additional_fee": "Additional fee",
    "sub_total": "Sub total",
    "total_amount": "Total amount",
    "checkout": "Checkout"
  },
  "order_summary": {
    "app_bar_title": "Order Summary",
    "congratulation": "Congratulations",
    "success_message": "Your order has been sucessfully placed",
    "back_to_home": "Back to Homepage"
  },
  "drawer": {
    "account_settings": "Account Settings",
    "vignette": "Vignettes",
    "payment": "Payments",
    "notification": "Notification",
    "settings": "Settings",
    "imprint": "Imprint",
    "support": "Support",
    "term_conditions": "Terms & Conditions",
    "privacy": "Privacy Policy",
    "sign_out": "Sign out"
  },
  "news": {
    "app_bar_title": "News",
    "read_more": "Read more"
  },
  "vignettes": {
    "app_bar_title": "Vignettes",
    "active": "Active",
    "expired": "Expired",
    "downloadPdf": "Download PDF",
    "extend": "Extend",
    "order_date": "Order Date",
    "validity_date": "Validity Date"
  },
  "personal_settings": {
    "personal_details": "Personal Details",
    "company_details": "Company Details"
  },
  "validation": {
    "password": "Please enter valid password",
    "email": "Please enter valid email address",
    "password_misMatch": "Please ensure both password fields have the same value.",
    "required_filed": "Please fill in the required field.",
    "validate_gender": "Please fill in the required field."
  },
  "server": {
    "credentials_exception": "Invalid credentials.",
    "customer_exist_exception": "Customer already exist.",
    "internal_exception": "Oops! Something went wrong on our end. Please try again later.",
    "internet_exception": "No internet connection. Please check your network settings and try again.",
    "unexpected_exception": "An unexpected error occurred. Please try again later or contact support for assistance.",
    "user_not_exist": "Customer is not exist.",
    "try_again": "Try Again",
    "no_route_text": "There is no results"
  },
  "reset_password": {
    "hint": "Please enter your e-mail address with which you registered",
    "app_bar_title": "Reset Password",
    "send": "Send",
    "success_message": "Please check your email inbox."
  },
  "log_out_pop_up": {
    "content": "Are you sure you want to log out?",
    "title": "Logout",
    "confirm_text": "Logout",
    "cancel_text": "Cancel"
  },
  "not_available_product": {
    "coming_soon_text": "You cannot currently purchase any products from us for this route.",
    "coming_soon_title": "Coming Soon!",
    "text": "There are no fees for the route you have chosen!",
    "title": "FREE RIDE!"
  },
  "one_option_dialog": {
    "date_error": "Start date should be before end date",
    "title": "Notice",
    "button_text": "Ok"
  },
  "defined_countries": {
    "austria": "Austria",
    "slovenia": "Slovenia"
  }
};
static const Map<String,dynamic> fr = {
  "my_app_name": "Toll Hopper",
  "skip_text": "Skip",
  "register": {
    "title": "Let’s get started",
    "sub_title": "Fill basic details to continue",
    "gender_title": "Salutaion",
    "gender_hint": "Select",
    "first_name_title": "First Name",
    "first_name_hint": "Enter your first Name",
    "last_name_title": "Last Name",
    "last_name_hint": "Entre your last name",
    "email_title": "Email",
    "email_hint": "Enter your email here",
    "password_title": "Password",
    "re_password_title": "Repeat Password",
    "re_password_hint": "Re-enter your password",
    "password_hint": "Entre your password",
    "checkbox_text": "By continuing you agree to toll hopper Terms and conditions, Privacy Policy.",
    "button_text": "Register",
    "gender_nothing": "Nothing",
    "gender_male": "Mr",
    "gender_female": "Mrs",
    "success_message": "your account has been created successfully"
  },
  "login": {
    "title": "Sign in",
    "keep_login": "Keep me logged in",
    "forget_password": "Forgot Password?",
    "dont_have_account": "Don’t have an account?",
    "register_here": "Register here",
    "or_sign_in_with": "Or Sign in with",
    "continue_as_guest": "Continue as a guest"
  },
  "home": {
    "home_bar": "Home",
    "route_plan": "Route Plan",
    "cart": "Cart",
    "calculator": "Toll Calculator",
    "news": "News"
  },
  "route_plan": {
    "app_bar_title": "Route Planner",
    "search": "Search",
    "input_label": "Please enter your desired location",
    "input_hint": "Enter Location"
  },
  "home_tab": {
    "title": "Find your packages",
    "choose": "Choose",
    "validity_text": "Valid Immediately Or Later If Desired."
  },
  "cart_tab": {
    "checkout": "Checkout",
    "app_bar_title": "Cart",
    "empty_cart_text": "Your Cart is Empty"
  },
  "calculator_tab": {
    "start": "Start",
    "destination": "Destination",
    "start_date": "Start Date",
    "end_date": "End Date",
    "select_date_hint": "Select Date",
    "select_car_hint": "Select Vehicle Type",
    "app_bar_title": "Toll Calculator"
  },
  "route_trajectory": {
    "app_bar_title": "Route Trajectory",
    "see_on_map": "See on map"
  },
  "toll_selection": {
    "app_bar_title": "Your Trip",
    "vignette": "Vignette",
    "tolls": "Tolls",
    "start": "Start",
    "end": "End",
    "digital_vignette": "Digital Vignette",
    "digital_toll": "Digital Route Toll",
    "return_text": "Book return toll fee"
  },
  "license_information": {
    "app_bar_title": "License Plate Information",
    "plate_number": "License Plate Number",
    "plate_number_hint": "EnterLicense Plate Number",
    "confirm_plate_number": "Confirm License Plate Number",
    "car_name": "Car Name",
    "car_name_hint": "Enter name here",
    "car_model": "Car Model",
    "car_model_hint": "Enter car model here",
    "car_energy": "Car Energy",
    "car_energy_hint": "Select"
  },
  "car_energy": {
    "gasoline": "Gasoline",
    "diesel": "Diesel",
    "electric": "Electric",
    "hybrid": "Hybrid",
    "pluginHybrid": "Plug-in hybrid",
    "hydrogen": "Hydrogen"
  },
  "cancel": "Cancel",
  "next": "Next",
  "choose": "Choose",
  "save": "Save",
  "contact_information": {
    "app_bar_title": "Contact Information",
    "request_an_invoice": "Request an invoice",
    "confirm_email": "Confirm Email",
    "company_name_title": "Company Name",
    "company_name_hint": "Entre name here",
    "country_title": "Country",
    "country_hint": "Entre country Here",
    "city_title": "City",
    "city_hint": "Entre city Here",
    "address_title": "Address",
    "address_hint": "Enter address here",
    "house_num_title": "House No",
    "house_num_hint": "Enter here",
    "postal_code_title": "Postal Code",
    "postal_code_hint": "Enter here",
    "create_account": "Create an account?",
    "set_password": "Set Password"
  },
  "payment_method": {
    "app_bar_title": "Payment Method",
    "proceed_to_checkout": "Proceed to Checkout",
    "credit_card": "Credit Card",
    "paypal": "Paypal",
    "klarna": "Klarna",
    "sofort_uberweisung": "Sofort Überweisung"
  },
  "checkout": {
    "app_bar_title": "Checkout",
    "name_label": "Name",
    "license_pate_number": "License Plate No.",
    "date_time": "Date & Time",
    "order_summary": "Order Summary",
    "package": "Package",
    "additional_fee": "Additional fee",
    "sub_total": "Sub total",
    "total_amount": "Total amount",
    "checkout": "Checkout"
  },
  "order_summary": {
    "app_bar_title": "Order Summary",
    "congratulation": "Congratulations",
    "success_message": "Your order has been sucessfully placed",
    "back_to_home": "Back to Homepage"
  },
  "drawer": {
    "account_settings": "Account Settings",
    "vignette": "Vignettes",
    "payment": "Payments",
    "notification": "Notification",
    "settings": "Settings",
    "imprint": "Imprint",
    "support": "Support",
    "term_conditions": "Terms & Conditions",
    "privacy": "Privacy Policy",
    "sign_out": "Sign out"
  },
  "news": {
    "app_bar_title": "News",
    "read_more": "Read more"
  },
  "vignettes": {
    "app_bar_title": "Vignettes",
    "active": "Active",
    "expired": "Expired",
    "downloadPdf": "Download PDF",
    "extend": "Extend",
    "order_date": "Order Date",
    "validity_date": "Validity Date"
  },
  "personal_settings": {
    "personal_details": "Personal Details",
    "company_details": "Company Details"
  },
  "validation": {
    "password": "Please enter valid password",
    "email": "Please enter valid email address",
    "password_misMatch": "Please ensure both password fields have the same value.",
    "required_filed": "Please fill in the required field.",
    "validate_gender": "Please fill in the required field."
  },
  "server": {
    "credentials_exception": "Invalid credentials.",
    "customer_exist_exception": "Customer already exist.",
    "internal_exception": "Oops! Something went wrong on our end. Please try again later.",
    "internet_exception": "No internet connection. Please check your network settings and try again.",
    "unexpected_exception": "An unexpected error occurred. Please try again later or contact support for assistance.",
    "user_not_exist": "Customer is not exist.",
    "try_again": "Try Again",
    "no_route_text": "There is no results"
  },
  "reset_password": {
    "hint": "Please enter your e-mail address with which you registered",
    "app_bar_title": "Reset Password",
    "send": "Send",
    "success_message": "Please check your email inbox."
  },
  "log_out_pop_up": {
    "content": "Are you sure you want to log out?",
    "title": "Logout",
    "confirm_text": "Logout",
    "cancel_text": "Cancel"
  },
  "not_available_product": {
    "coming_soon_text": "You cannot currently purchase any products from us for this route.",
    "coming_soon_title": "Coming Soon!",
    "text": "There are no fees for the route you have chosen!",
    "title": "FREE RIDE!"
  },
  "one_option_dialog": {
    "date_error": "Start date should be before end date",
    "title": "Notice",
    "button_text": "Ok"
  },
  "defined_countries": {
    "austria": "Austria",
    "slovenia": "Slovenia"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"nl": nl, "de": de, "en": en, "fr": fr};
}
