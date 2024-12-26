class ApiConfig {
  static const String BASE_URL = "https://psnetsollhr.southeastasia.cloudapp.azure.com:8443/";

  // Auth Endpoints
  static const String LOGIN = "auth/login";
  static const String VERIFY_USER = "auth/verifyUser/{userId}";
  static const String VERIFY_USER_CHECK = "auth/verifyUser";
  static const String SEND_OTP = "otp/send";
  static const String VERIFY_OTP = "otp/verify";
  static const String REGISTER_RIDER = "user/register-rider";
  static const String REFRESH_TOKEN_URL = "auth/refresh";
  static const String LOGOUT_URL = "auth/logout";

  // Region Endpoints
  static const String GET_COUNTRIES = "region/countries";
  static const String GET_CITIES = "region/cities/{countryId}";

  // User Endpoints
  static const String GET_RIDER_PROFILE = "user/rider/{userId}";
  static const String UPDATE_RIDER_PROFILE = "user/rider-profile";
  static const String UPLOAD_RIDER_PROFILE_IMAGE = "image/user-profile";

  // Lookup Endpoints
  static const String GET_GENDER = "lookup/LKGender";
  static const String GET_PAYMENT_METHODS = "lookup/LKPaymentCategories";
  static const String GET_LANGUAGE_LIST = "lookup/LKLanguagePreference";
  static const String GET_VEHICLE_TYPE_LIST = "lookup/LKCarCategory";
  static const String GET_ADDRESS_TYPE_LIST = "lookup/LKRiderAddress";
  static const String GET_RIDE_HISTORY_FILTER = "lookup/LKRideHistory";

  // Ride Endpoints
  static const String CALCULATE_FARE = "rider/calculate-fare";
  static const String REQUEST_RIDE = "ride/rider/request-ride/{paymentMethodId}";
  static const String CANCEL_RIDE_REQUEST = "ride/rider/cancel-ride-request/{rideId}";
  static const String CANCEL_RIDE = "ride/cancel-ride";
  static const String GET_RIDE_HISTORY = "ride/ride-history";
  static const String GET_RIDE_DISPUTES = "ride/ride-disputes/{rideId}";
  static const String RIDE_RATING = "ride/rating";
  static const String RAISE_DISPUTE = "rider/raise-dispute";
  static const String CAPTURE_PAYMENT = "ride/payment/capture-payment";

  // Schedule Ride Endpoints
  static const String SCHEDULE_RIDE = "ride/schedule-ride";
  static const String GET_SCHEDULE_RIDES_LIST = "ride/schedule-ride-history";
  static const String CANCEL_SCHEDULE_RIDE = "ride/cancel-scheduled-ride";

  // Address Endpoints
  static const String SAVED_ADDRESSES = "rider/address";
  static const String DELETE_ADDRESS = "rider/address/{addressId}";
  static const String POST_ADDRESS = "rider/address";

  // Payment Endpoints
  static const String POST_CARD = "ride/payment/add-card";
  static const String GET_CARD = "ride/payment/cards-details";
  static const String DELETE_CARD = "ride/payment";

  // Notification Endpoints
  static const String ADD_DEVICE_TOKEN = "notification/device-token";
  static const String NOTIFICATIONS = "ride/notifications";

  // Miscellaneous Endpoints
  static const String GET_DIRECTIONS = "maps/api/directions/json?";
  static const String DASHBOARD_DATA = "user/rider/dashboard";
  static const String ICON_BY_NAME = "image/assets/{imageName}";
  static const String IMAGE_BY_NAME = "image/{imageName}";
  static const String DELETE_ACCOUNT = "user";
  static const String GET_LOCALIZATION = "localize";
  static const String GET_CONFIGURATION = "configuration";
  static const String GET_CHAT = "ride/chat";
}
