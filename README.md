# weather_app_flutter

## Required Permissions

To ensure the proper functioning of this application, you need to add the following permissions to your `AndroidManifest.xml` file. These permissions are necessary for accessing the device's location services.

### Permissions to Add

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

