total 18128
drwxr-xr-x 2 runner runner     4096 Nov 17 15:39 .
drwxr-xr-x 7 runner runner     4096 Nov 17 15:39 ..
-rw-r--r-- 1 runner runner 18550944 Nov 17 15:39 15puzzle.aab
bundletool: https://github.com/google/bundletool/releases/download/1.18.3/bundletool-all-1.18.3.jar
<manifest xmlns:android="http://schemas.android.com/apk/res/android" android:compileSdkVersion="30" android:compileSdkVersionCodename="11" android:versionCode="39" android:versionName="2.2.2" package="com.artemchep.fifteenpuzzle" platformBuildVersionCode="30" platformBuildVersionName="11">
      
  <uses-sdk android:minSdkVersion="16" android:targetSdkVersion="30"/>
      
    
  <uses-permission android:name="android.permission.INTERNET"/>
      
  <uses-permission android:name="com.android.vending.BILLING"/>
      
    
  <application android:appComponentFactory="androidx.core.app.CoreComponentFactory" android:icon="@mipmap/ic_launcher" android:label="@string/app_name" android:name="io.flutter.app.FlutterApplication">
            
    <activity android:configChanges="0x400035b4" android:hardwareAccelerated="true" android:launchMode="1" android:name="com.artemchep.fifteenpuzzle.MainActivity" android:theme="@style/LaunchTheme" android:windowSoftInputMode="0x00000010">
                  
            
      <meta-data android:name="io.flutter.app.android.SplashScreenUntilFirstFrame" android:value="true"/>
                  
      <intent-filter>
                        
        <action android:name="android.intent.action.MAIN"/>
with bundletool: libs ['libapp.so', 'libflutter.so']
by hand: libs ['libapp.so', 'libflutter.so']
