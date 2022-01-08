package com.creospace.trashsure.presentation.register

import com.creospace.trashsure.model.User

interface RegisterContract {

    interface View {
        fun showLoading()
        fun hideLoading()
        fun showRegisterSuccess(message: String)
        fun showRegisterFailed(message: String)
    }

    interface Presenter {
        fun postRegister(user: User)
    }
}