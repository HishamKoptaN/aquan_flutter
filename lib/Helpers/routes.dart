const String domain = "https://api.aquan.website/api";

const Map<String, dynamic> api = {
  "login": "$domain/login",
  "register": "$domain/auth/register",
  "check": "$domain/check",
  "buy_sell_status": "$domain/api/buy_sell_status",
  "password": {
    "reset": "$domain/auth/reset-password",
  },
  //-------------------------------//
  "get-account-name": "$domain/get-account-by-id/",
  "confirm-email": "$domain/v1/user/verify",
  "send-confirm-email": "$domain/v1/user/verify",
  "send-code-to-email": "$domain/resendcode",
  "dashboard": "$domain/dashboard",
  "profile_update": "$domain/user/update",
  "currencies": "$domain/currencies",
  "settings": "$domain/settings",
  "tasks": "$domain/tasks",
  "notifications": "$domain/notifications",
  "deposits_withdraws": "$domain/deposits-withdraws",
  "user_account_info": "$domain/user/account-info",
  "buy_sell": "$domain/buy-sell",
  "update_accounts_user": "$domain/user/update-accounts-info",
  "user_accounts": "$domain/user/accounts",
  "user_update_image": "$domain/user/update-image",
  //-------------------------------//
  "task": "$domain/tasks/",
  "get_employee_id": "$domain/employee/",
  "get_user_pan": "$domain/user/plan/",
  "referals": "$domain/referals",
  "user": "$domain/user",
  "change-password": "$domain/user/change-password",
  "plans": "$domain/plans",
  "wallets": "$domain/wallets",
  "transactions": "$domain/transactions",
  "deposit": "$domain/deposit",
  "withdraw": "$domain/withdraw",

  "transfer": "$domain/transfer/",
  "create_withdraw": "$domain/create/withdraw",
//-------------------------------//

  "support": "$domain/support",
  "account": "$domain/account/",
  "deposits-and-withdraws": "$domain/get-withdraws-deposits",
  "auth-google": "$domain/auth/login/google",
  "auth-google-complete": "$domain/auth/login/google/complete",
  "debug": "$domain/debug",
};
