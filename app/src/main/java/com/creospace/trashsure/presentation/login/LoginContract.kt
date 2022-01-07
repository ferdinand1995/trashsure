package com.creospace.trashsure.presentation.login

import com.creospace.trashsure.model.User

interface LoginContract {

    interface View {
        fun showLoading()
        fun hideLoading()
        fun showLoginSuccess(user: User)
        fun showLoginFailed(message: String)
    }

    interface Presenter {
        fun postLogin(phone: String, password: String)
    }
}