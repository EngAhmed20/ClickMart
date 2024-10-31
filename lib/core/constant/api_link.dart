class AppLinks{
  static const String serverLink="http://10.0.2.2/ecommerce/";
  static const String testLink="${serverLink}test.php";
  static const String signUpLink="${serverLink}auth/signup.php";
  static const String verifySignCode="${serverLink}auth/verify.php";
  static const String loginLink="${serverLink}auth/login.php";
  //======================forget pass==========================//
  static const String checkEmailLink="${serverLink}forgetpassword/checkemail.php";
  static const String verifyResetLink="${serverLink}forgetpassword/verifycode.php";
  static const String resendVerifyCode="${serverLink}auth/resend.php";
  static const String resetPasswordLink="${serverLink}forgetpassword/resetpassword.php";

  //======================home==========================//
  static const String homeLink="${serverLink}home.php";
  static const String itemsLink="${serverLink}items/items.php";
  static const String searchLink="${serverLink}items/search.php";
  static const String searchOfferLink="${serverLink}items/search_offer.php";
  static const String offersItem="${serverLink}offers.php";


  //==================image=======/
  static const String imageLink="http://10.0.2.2/ecommerce/upload/";
  static const String catImgLink="${imageLink}categories/";
  static const String itemsImgLink="${imageLink}items/";
  //======================fav==========================//
static const String addFavLink="${serverLink}favorite/add.php";
static const String deleteFavLink="${serverLink}favorite/remove.php";
static const String favLink="${serverLink}favorite/view.php";
  //======================cart==========================//
  static const String addToCartLink="${serverLink}cart/add.php";
  static const String deleteCartLink="${serverLink}cart/remove.php";
  static const String cartView="${serverLink}cart/view.php";
  static const String cartGetCountItem="${serverLink}cart/getcountitem.php";
  //====================coupon==========================//
  static const String couponLink="${serverLink}coupon/checkcoupon.php";
  //=======================address==========================//
  static const String addressLink="${serverLink}address/view.php";
  static const String addressAddLink="${serverLink}address/add.php";
  static const String addressUpdateLink="${serverLink}address/update.php";
  static const String addressDeleteLink="${serverLink}address/delete.php";
  //========================order==========================//
  static const String checkoutOrderLink="${serverLink}checkout/add.php";
  static const String pendingOrdersLink="${serverLink}checkout/pending.php";
  static const String archivedOrdersLink="${serverLink}checkout/archived.php";
  static const String orderDetailsLink="${serverLink}checkout/order_details.php";
  static const String deleteOrdersLink="${serverLink}checkout/delete_order.php";
  static const String deleteArchivedOrder="${serverLink}checkout/remove_archived_order.php";
  static const String orderRating="${serverLink}checkout/order_rating.php";
  //=============notification================//
  static const String notificationLink="${serverLink}notification/notifications.php";
  static const String deleteNotification="${serverLink}notification/delete.php";






}