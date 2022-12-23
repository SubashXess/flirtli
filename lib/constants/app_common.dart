import 'package:flirtli/constants/app_constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

void appSetting() {
  kChatFontSize = getIntAsync(FONT_SIZE_PREF, defaultValue: 16);
  kIsEnterKey = getBoolAsync(IS_ENTER_KEY, defaultValue: false);
  // kSelectedImage = getStringAsync(SELECTED_WALLPAPER, defaultValue: "");
}
