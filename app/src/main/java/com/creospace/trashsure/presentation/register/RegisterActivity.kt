package com.creospace.trashsure.presentation.register

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.creospace.trashsure.databinding.ActivityMainBinding
import com.creospace.trashsure.model.User

class RegisterActivity : AppCompatActivity(), RegisterContract.View {

    private var _binding: ActivityMainBinding? = null
    private val binding get() = _binding!!

    private lateinit var presenter: RegisterPresenter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        presenter = RegisterPresenter(this)
        initView()
    }

    private fun initView() {
        binding.btnRegister.setOnClickListener {
            val name = binding.edtName.text.toString()
            val phone = binding.edtPhone.text.toString()
            val password = binding.edtPassword.text.toString()

            val user = User(name, phone, password)

            presenter.postRegister(user)
        }
    }

    override fun showLoading() {
        binding.progressBar.visibility = View.VISIBLE
    }

    override fun hideLoading() {
        binding.progressBar.visibility = View.GONE
    }

    override fun showRegisterSuccess(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    override fun showRegisterFailed(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }
}