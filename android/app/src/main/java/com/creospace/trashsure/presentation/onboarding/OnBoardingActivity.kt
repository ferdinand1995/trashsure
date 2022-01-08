package com.creospace.trashsure.presentation.onboarding

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.creospace.trashsure.R
import com.creospace.trashsure.databinding.ActivityOnBoardingBinding
import com.creospace.trashsure.utils.ViewPagerAdapter

class OnBoardingActivity : AppCompatActivity() {

    private var _binding: ActivityOnBoardingBinding? = null
    private val binding get() = _binding!!

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding = ActivityOnBoardingBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupViewPager()
    }

    private fun initView() {
        setupViewPager()
    }

    private fun setupViewPager() {
        val onBoardingViewPagerAdapter = ViewPagerAdapter(supportFragmentManager)
        onBoardingViewPagerAdapter.populateFragment(OnBoarding1Fragment(), "")
        onBoardingViewPagerAdapter.populateFragment(OnBoarding2Fragment(), "")
        onBoardingViewPagerAdapter.populateFragment(OnBoarding3Fragment(), "")
        binding.viewPagerOnBoarding.apply {
            adapter = onBoardingViewPagerAdapter
            binding.dotsIndicator.setViewPager(this)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}