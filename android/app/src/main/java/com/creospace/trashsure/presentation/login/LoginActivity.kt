package com.creospace.trashsure.presentation.login

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.creospace.trashsure.R
import com.creospace.trashsure.databinding.ActivityLoginBinding
import com.creospace.trashsure.model.User
import com.creospace.trashsure.presentation.register.RegisterActivity

class LoginActivity : AppCompatActivity(), LoginContract.View {

    private var _binding: ActivityLoginBinding? = null
    private val binding get() = _binding!!

    private lateinit var presenter: LoginPresenter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        presenter = LoginPresenter(this)
        initView()
    }

    private fun initView() {
        binding.btnLogin.setOnClickListener {
            val phone = binding.edtPhone.text.toString()
            val password = binding.edtPassword.text.toString()
            presenter.postLogin(phone, password)
        }

        binding.tvRegisterHere.setOnClickListener {
            startActivity(Intent(this, RegisterActivity::class.java))
        }
    }

    override fun showLoginSuccess(user: User) {
        Toast.makeText(this, "Hello, ${user.name}", Toast.LENGTH_SHORT).show()
    }

    override fun showLoginFailed(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    override fun showLoading() {
        binding.progressBar.visibility = View.VISIBLE
    }

    override fun hideLoading() {
        binding.progressBar.visibility = View.GONE
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}