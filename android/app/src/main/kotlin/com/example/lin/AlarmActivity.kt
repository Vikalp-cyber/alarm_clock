package com.example.lin

import android.media.RingtoneManager
import android.media.Ringtone
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class AlarmActivity : AppCompatActivity() {

    private lateinit var ringtone: Ringtone

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_alarm)

        // Play alarm sound
        val alarmSound: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM)
        ringtone = RingtoneManager.getRingtone(this, alarmSound)
        ringtone.play()

        // Stop alarm when button is clicked
        val stopButton: Button = findViewById(R.id.stop_alarm_button)
        stopButton.setOnClickListener {
            ringtone.stop()
            finish()
        }
    }
}
