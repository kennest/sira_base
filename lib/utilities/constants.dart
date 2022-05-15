// const String BASE_URL = "http://coa-dev.ddns.net:5004/api/v1/";
const String BASE_URL = "https://kiwi.ci/api/v1/";
// const String BASE_URL = "https://kiwi-richs.loca.lt/api/v1/";
const String LOGIN_URL = "${BASE_URL}login";
const String REGISTER_URL = "${BASE_URL}register";
const String UPDATE_TOKEN_URL = "${BASE_URL}update-token";
const String BANNERS = "${BASE_URL}banners";
const String PLAYERID_URL = "${BASE_URL}playerid";
const String CORNERS = "${BASE_URL}corners";
const String CORNER_PROGRAMS =
    "${BASE_URL}corner/{corner}?offset={offset}&limit={limit}";
const String CHANNELS = "${BASE_URL}channels";
const String SEARCH =
    "${BASE_URL}search?query={query}&offset={offset}&limit={limit}";
const String COUNTRIES = "${BASE_URL}countries";
const String GATEWAYS = "${BASE_URL}gateways";
const String PLANS = "${BASE_URL}plans";
const String OFFERS = "${BASE_URL}offers";
const String MEDIA_URL = "${BASE_URL}media/{code}";
const String SUBSCRIPTIONS = "${BASE_URL}subscriptions";
const String DOWNLOAD = "${BASE_URL}download";
const String PAYMENT =
    "${BASE_URL}payment/subscribe/{gateway}/plan/{plan}/corner/{corner}";
const String PAYMENT_STATUS_URL = "${BASE_URL}getstatus/{payment}";
const String SAVE_MEDIA_TIME_URL = "${BASE_URL}savewatch/{playerid}/save";
const String ACTIVE_SUBSCRIPTIONS = "${BASE_URL}subscriptions?state=active";
const String SEASON_EPISODES = "${BASE_URL}saison/{id}/episodes";
const String LIKE_PROGRAM = "${BASE_URL}like/{id}/add";
const String LIKE_STATUS_PROGRAM = "${BASE_URL}like/{id}";
const String ALL_LIKES = "${BASE_URL}likes";
const String UPDATE_PROFILE = "${BASE_URL}profile/edit";
const String UPDATE_PASSWORD = "${BASE_URL}password/update";
const String FORGOT_PASSWORD = "${BASE_URL}forgot-password";
const String PROFILE = "${BASE_URL}profile";
const String RECENT_VIEW = "${BASE_URL}recent-views";
const String XTOKEN =
    "3f96bf5e19b197942136ecf2ff56a04c1eb6a90f6a4a643bd2235cd51af663f6";
