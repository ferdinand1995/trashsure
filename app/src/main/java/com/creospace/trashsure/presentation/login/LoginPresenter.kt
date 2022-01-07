package com.creospace.trashsure.presentation.login

import com.creospace.trashsure.model.User
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener

class LoginPresenter(private val view: LoginContract.View) : LoginContract.Presenter {

    private lateinit var user: User
    private var database: FirebaseDatabase = FirebaseDatabase.getInstance()
    private var reference = database.reference.child("Users")

    override fun postLogin(phone: String, password: String) {
        view.showLoading()

        reference.child(phone).addListenerForSingleValueEvent(object : ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {
                if (dataSnapshot.exists()) {
                    view.hideLoading()
                    user = dataSnapshot.getValue(User::class.java)!!
                    if (user.password == password) {
                        view.showLoginSuccess(user)
                    } else {
                        view.showLoginFailed("Password salah")
                    }
                } else {
                    view.hideLoading()
                    view.showLoginFailed("Pengguna tidak terdaftar")
                }
            }

            override fun onCancelled(p0: DatabaseError) {
                view.hideLoading()
                view.showLoginFailed(p0.message)
            }
        })    }


}