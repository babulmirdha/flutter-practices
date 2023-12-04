package com.example.call_function_from_android_in_flutter.utils

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.os.Build
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.annotation.RequiresApi

object NetworkUtils {

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isVpnInUse(context: Context):Boolean {

        try {

            val connectivityManager = context.getSystemService(ComponentActivity.CONNECTIVITY_SERVICE) as ConnectivityManager

            val activeNetwork: Network? = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                connectivityManager.activeNetwork
            } else {

                val networks = connectivityManager.allNetworks
                var activeNetwork: Network? = null

                for (network in networks) {
                    if (connectivityManager.getNetworkInfo(network)?.isConnected!!) {
                        activeNetwork = network
                        break
                    }
                }

                 activeNetwork

            }
            val caps: NetworkCapabilities? = connectivityManager.getNetworkCapabilities(activeNetwork)
            val vpnInUse = caps?.hasTransport(NetworkCapabilities.TRANSPORT_VPN)


            return vpnInUse ?: false;

        }catch (e:Exception){
            e.printStackTrace()
        }


        return false

    }
}