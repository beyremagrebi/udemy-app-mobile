#keep iterfaces and their members from ProGuard stripping
-keep,allowobfuscation @interface com.facebook.proguard.annotations.DoNotStrip
-keep,allowobfuscation @interface com.facebook.proguard.annotations.KeepGettersAndSetters
-keepclassmembers class * {
    @com.facebook.proguard.annotations.DoNotStrip *;
}
-keep class org.webrtc.** {*;}
-keep class org.jitsi.meet.** {*;}
-keep class org.jitsi.meet.Sdk.** {*;}

# Additional rules related to React Native
-keep class * extends com.facebook.react.bridge.JavaScriptModuler {*;}
-keep class * extends com.facebook.react.bridge.NativeModule {*;}
-keepclassmembers class * {native <methods>;}

#Configuration to avoid SVG build errors
-keep public class com.horcrux.svg.** {*;}