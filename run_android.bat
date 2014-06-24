cd C:\Program Files\Android\android-sdk\platform-tools
adb -s 4df1c7ad79f44f09 shell am start -a android.intent.action.MAIN -n org.openqa.selenium.android.app/.MainActivity
sleep 2
adb -s 4df1c7ad79f44f09 forward tcp:8080 tcp:8080
cd d:\projects\RubySpike
set BROWSER=android
set TEST_ENV=qa
cucumber features\step_definitions\