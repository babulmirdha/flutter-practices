package com.example.detect_vpn_android_demo

import android.annotation.SuppressLint
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.detect_vpn_android_demo.ui.theme.Detect_vpn_android_demoTheme


class MainActivity : ComponentActivity() {

    val TAG = "MainActivity"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Detect_vpn_android_demoTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Greeting("VPN in Use:${isVpnInUse()}")
                }
            }
        }


    }

    override fun onResume() {


        super.onResume()


    }

    @SuppressLint("MissingPermission")
    private fun isVpnInUse():Boolean {

        try {

            val connectivityManager = getSystemService(CONNECTIVITY_SERVICE) as ConnectivityManager

            val activeNetwork: Network? = connectivityManager.activeNetwork
            val caps: NetworkCapabilities? = connectivityManager.getNetworkCapabilities(activeNetwork)
            val vpnInUse = caps?.hasTransport(NetworkCapabilities.TRANSPORT_VPN)


            return vpnInUse ?: false;

            Log.i(TAG,   "${vpnInUse}");

        }catch (e:Exception){
            e.printStackTrace()
        }


        return false

    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    Detect_vpn_android_demoTheme {
        Greeting("Android")
    }
}