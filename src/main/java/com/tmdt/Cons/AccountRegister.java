package com.tmdt.Cons;

import com.tmdt.model.AccountModel;

public class AccountRegister {

    public static AccountModel accountRegister;

    public static AccountModel getAccountRegister() {
        return accountRegister;
    }

    public static void setAccountRegister(AccountModel accountRegister) {
        AccountRegister.accountRegister = accountRegister;
    }
    public static void reset()
    {
        AccountModel acc = new AccountModel();
        accountRegister = acc;
    }
}
