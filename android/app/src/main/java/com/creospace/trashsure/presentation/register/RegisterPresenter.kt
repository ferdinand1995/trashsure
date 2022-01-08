package com.creospace.trashsure.presentation.register

import com.creospace.trashsure.model.User
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener

class RegisterPresenter(private val view: RegisterContract.View): RegisterContract.Presenter {

    private var database: FirebaseDatabase = FirebaseDatabase.getInstance()
    private var reference = database.reference.child("Users")

    override fun postRegister(user: User) {
        view.showLoading()

        reference.child(user.phone).addListenerForSingleValueEvent(object : ValueEventListener {
            override fun onCancelled(error: DatabaseError) {
                view.hideLoading()
                view.showRegisterFailed(error.message)
            }

            override fun onDataChange(dataSnapshot: DataSnapshot) {
                if (dataSnapshot.exists()) {
                    view.showRegisterFailed("Nama pengguna telah terdaftar")
                    view.hideLoading()
                } else {
                    dataSnapshot.ref.setValue(user)
                    view.showRegisterSuccess("Berhasil membuat akun")
                    view.hideLoading()
                }
            }
        })
    }
}