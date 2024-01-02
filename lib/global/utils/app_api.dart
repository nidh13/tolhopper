// app web url
const webUrl = "https://tollhopper.com/";

// global app domain
const globalApiDomain = "https://api.tollhopper.com:8080";

// ----------------------------- auth ------------------------
const registerApi = globalApiDomain + "/api/customer/register/";

const registerGuestApi = globalApiDomain + "/api/customer/guest";

const loginApi = globalApiDomain + "/api/customer/login";

const resetPasswordApi =
    globalApiDomain + "/api/customer/resetPasswordRequest/";

const getUserApi = globalApiDomain + "/api/customer/getCustomerById/";

const updateUserApi = globalApiDomain + "/api/customer/update/";

// ------------------------------ products -----------------------------
const getAllVignetteProductApi = globalApiDomain + "/api/products/getAll";

const getAllVignetteProductFilterApi = globalApiDomain + "/api/products/filter";

// ------------------------------ vehicle -----------------------------
const getAllVehiclesApi = globalApiDomain + "/api/vehicle";

// ------------------------------ routes -----------------------------
//const tollGruApi = "https://dev.tollguru.com/v1/calc/here";
const tollGruApi =
    "https://apis.tollguru.com/toll/v2/origin-destination-waypoints";

// ------------------------------ payment -----------------------------
const orderCreate = globalApiDomain + "/api/order/create/mobile";

// ------------------------------ google places api -----------------------------
const googleApiBaseUrl = "https://maps.googleapis.com/maps/";

const googleApiAutoComplete = "api/place/autocomplete/json";

const googleApiDetails = "api/place/details/json";

// --------------------------- News ----------------------------------------
const contentApiBaseUrl = 'https://$contentDomainApi';
const contentDomainApi = 'content.tollhopper.com';
const newsApiBlogs = '/api/blogs';
const mapsApi = '/api/home-page';

// --------------------------- Vignettes -------------------------------
const getVignetteHistory = '/api/products/vignette/list';
